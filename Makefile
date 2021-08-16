include ./config.makefile

names := erlang elixir golang nodejs deno python opam clojure redis ruby rust terraform v java zig sbcl

.PHONY: pull install install_parallel asdf plugins

SPACE := $() $()
ERROR_COLOR=\x1b[31;01m
SUCCESS_COLOR=\x1b[32;01m
NO_COLOR=\x1b[0m

# Erlang
export EGREP = egrep
export CC = clang
export CPP = clang -E
export KERL_USE_AUTOCONF = 0

fn_version_regex = $(subst $(SPACE),|,$(subst .,\.,$(1)))

default: pull install_parallel

pull:
	git pull --rebase

install_parallel: asdf
	$(MAKE) plugins
	$(MAKE) -j 10 install
	$(MAKE) global

asdf:
	asdf update

LIMIT ?= 5

define fn_list_named
	@echo "=> $(1) $($(1)_versions)"
	@asdf list-all $(1) | grep -E '^\d+\.\d+\.\d+' | sed -e 's/^/   $(1) /' | tail -n $(LIMIT)
endef

$(foreach name,$(names),$(name)):
	@echo "$@ | latest:" $(shell asdf latest $@) "|" "current:" $($(@)_versions)

# Lazy but run once
all_terraform_versions = $(eval all_terraform_versions := $(shell asdf list-all terraform))$(all_terraform_versions)
list_terraform:
	@echo $(all_terraform_versions) | tr " " "\n" | grep -e '^0\.11\.' | tail -n 1 | sed -e 's/^/terraform /'
	@echo $(all_terraform_versions) | tr " " "\n" | grep -e '^0\.12\.' | tail -n 3 | sed -e 's/^/terraform /'

list:
	@echo "Installed:"
	@make -j 10 $(names)

latest:
	@echo "Retrieving latest for: $(names)"
	@make -j 10 $(names) | column -t -s"|"

install_tasks := $(foreach name,$(names),$(foreach suffix,$($(name)_versions),$(name)_$(suffix)))

plan:
	@echo $(install_tasks) | sed "y/ /\n/"

# Define tasks such as golang_1.13.5
$(foreach task,$(install_tasks),$(task)): asdf
	#asdf plugin update $(firstword $(subst _, ,$@))
	asdf install $(subst _, ,$@)

install: $(install_tasks)

# Define tasks such as update_golang
$(foreach name,$(names),update_$(name)): asdf
	asdf plugin update $(subst update_,,$@)
	asdf latest $(subst update_,,$@) | pbcopy
	$(MAKE) $(subst update_,,$@)
	micro config.makefile
	$(MAKE) install
	git add config.makefile
	git commit -m "Update $(subst update_,,$@)"

global:
	asdf global elixir $(firstword $(elixir_versions)) || true
	asdf global erlang $(firstword $(erlang_versions)) || true
	asdf global golang $(firstword $(golang_versions)) || true
	asdf global nodejs $(firstword $(nodejs_versions)) || true
	asdf global deno $(firstword $(deno_versions)) || true
	asdf global python $(firstword $(python_versions)) || true
	asdf global clojure $(firstword $(clojure_versions)) || true
	asdf global opam $(firstword $(opam_versions)) || true
	asdf global ruby $(firstword $(ruby_versions)) || true
	asdf global rust $(firstword $(rust_versions)) || true
	asdf global terraform $(firstword $(terraform_versions)) || true
	asdf global v $(firstword $(v_versions)) || true
	asdf global java $(firstword $(java_versions)) || true
	asdf global zig $(firstword $(zig_versions)) || true
	asdf global sbcl $(firstword $(sbcl_versions)) || true

plugins: asdf
	@-asdf plugin-add clojure         https://github.com/halcyon/asdf-clojure.git         || true
	@-asdf plugin-add crystal         https://github.com/marciogm/asdf-crystal.git        || true
	@-asdf plugin-add dep             https://github.com/paxosglobal/asdf-dep             || true
	@-asdf plugin-add elixir          https://github.com/asdf-vm/asdf-elixir              || true
	@-asdf plugin-add elm             https://github.com/vic/asdf-elm.git                 || true
	@-asdf plugin-add erlang          https://github.com/asdf-vm/asdf-erlang.git          || true
	@-asdf plugin-add golang          https://github.com/kennyp/asdf-golang.git           || true
	@-asdf plugin-add haskell         https://github.com/vic/asdf-haskell.git             || true
	@-asdf plugin-add java            https://github.com/skotchpine/asdf-java.git         || true
	@-asdf plugin-add nodejs          https://github.com/asdf-vm/asdf-nodejs.git          || true
	@-asdf plugin-add deno            https://github.com/asdf-community/asdf-deno.git     || true
	@-asdf plugin-add opam            https://github.com/asdf-community/asdf-opam.git     || true
	@-asdf plugin-add postgres        https://github.com/smashedtoatoms/asdf-postgres     || true
	@-asdf plugin-add python          https://github.com/danhper/asdf-python.git          || true
	@-asdf plugin-add rebar           https://github.com/Stratus3D/asdf-rebar             || true
	@-asdf plugin-add redis           https://github.com/smashedtoatoms/asdf-redis.git    || true
	@-asdf plugin-add ruby            https://github.com/asdf-vm/asdf-ruby                || true
	@-asdf plugin-add rust            https://github.com/code-lever/asdf-rust.git         || true
	@-asdf plugin-add consul          https://github.com/Banno/asdf-hashicorp.git         || true
	@-asdf plugin-add packer          https://github.com/Banno/asdf-hashicorp.git         || true
	@-asdf plugin-add terraform       https://github.com/Banno/asdf-hashicorp.git         || true
	@-asdf plugin-add vault           https://github.com/Banno/asdf-hashicorp.git         || true
	@-asdf plugin-add v || true
	@-asdf plugin add zig || true
	@-asdf plugin add sbcl https://github.com/smashedtoatoms/asdf-sbcl.git || true
	@asdf plugin-update --all          >/dev/null