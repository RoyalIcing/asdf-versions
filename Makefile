include ./config.makefile

names := erlang elixir gleam golang nodejs deno bun python opam clojure redis ruby rust terraform v java zig sbcl swiprolog

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

# Postgres
export POSTGRES_EXTRA_CONFIGURE_OPTIONS="--with-openssl --with-libraries=/usr/local/lib:/opt/homebrew/opt/openssl/lib --with-includes=/usr/local/include:/opt/homebrew/opt/openssl/include"

fn_version_regex = $(subst $(SPACE),|,$(subst .,\.,$(1)))

default: pull install_parallel

pull:
	-git pull --rebase

install_parallel: asdf
	$(MAKE) plugins
	$(MAKE) -j 10 install
	$(MAKE) global
	$(MAKE) extra

asdf:
	#asdf update

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
	asdf global erlang $(firstword $(erlang_versions)) || true
	asdf global elixir $(firstword $(elixir_versions)) || true
	asdf global gleam $(firstword $(gleam_versions)) || true
	asdf global golang $(firstword $(golang_versions)) || true
	asdf global nodejs $(firstword $(nodejs_versions)) || true
	asdf global deno $(firstword $(deno_versions)) || true
	asdf global bun $(firstword $(bun_versions)) || true
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
	asdf global swiprolog $(firstword $(swiprolog_versions)) || true

extra:
	asdf reshim
	npm i -g --no-fund npm
	pip install -q -U pip
	pip install -q httpstat
	pip install -q mycli
	pip install -q sqlite-utils
	pip install -q datasette
	pip install -q datasette-atom
	pip install -q datasette-render-images
	pip install -q datasette-vega
	pip install -q datasette-publish-vercel
	pip install -q datasette-publish-fly
	asdf reshim python
	rustup target add wasm32-unknown-unknown

postgres_latest:
	POSTGRES_EXTRA_CONFIGURE_OPTIONS="--with-openssl --with-libraries=/usr/local/lib:/opt/homebrew/opt/openssl/lib --with-includes=/usr/local/include:/opt/homebrew/opt/openssl/include" asdf install postgres latest

plugins: asdf
	@-asdf plugin-add clojure          || true
	@-asdf plugin-add crystal          || true
	@-asdf plugin-add dep              || true
	@-asdf plugin-add erlang           || true
	@-asdf plugin-add elixir           || true
	@-asdf plugin-add gleam            || true
	@-asdf plugin-add elm              || true
	@-asdf plugin-add golang           || true
	@-asdf plugin-add haskell          || true
	@-asdf plugin-add java             || true
	@-asdf plugin-add nodejs           || true
	@-asdf plugin-add deno             || true
	@-asdf plugin-add opam             || true
	@-asdf plugin-add postgres         || true
	@-asdf plugin-add python           || true
	@-asdf plugin-add rebar            || true
	@-asdf plugin-add redis            || true
	@-asdf plugin-add ruby             || true
	@-asdf plugin-add rust             || true
	@-asdf plugin-add consul           || true
	@-asdf plugin-add packer           || true
	@-asdf plugin-add terraform        || true
	@-asdf plugin-add vault            || true
	@-asdf plugin-add swiprolog        || true
	@-asdf plugin-add v || true
	@-asdf plugin add zig || true
	@-asdf plugin add sbcl https://github.com/smashedtoatoms/asdf-sbcl.git || true
	@asdf plugin-update --all          >/dev/null
