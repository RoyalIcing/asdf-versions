erlang_versions := 22.3.3
elixir_versions := 1.10.2-otp-22 1.8.2 1.9.4
golang_versions := 1.13.10 1.14.2 1.12.10
nodejs_versions := 12.15.0 10.15.3
python_versions := 3.8.2 2.7.16
redis_versions := 5.0.9
ruby_versions := 2.6.5 2.7.1
rust_versions := 1.43.0
terraform_versions := 0.12.24 0.11.14
v_versions := 0.1.24

SPACE := $() $()
ERROR_COLOR=\x1b[31;01m
SUCCESS_COLOR=\x1b[32;01m
NO_COLOR=\x1b[0m

fn_version_regex = $(subst $(SPACE),|,$(subst .,\.,$(1)))

default: plugins list

# Define tasks such as golang_1.13.5
$(foreach task,$(all_versions),$(task)):
	asdf install $(subst _, ,$@)

LIMIT ?= 5

define fn_list_named
	@echo "=> $(1) $($(1)_versions)"
	@asdf list-all $(1) | grep -E '^\d+\.\d+\.\d+' | sed -e 's/^/   $(1) /' | tail -n $(LIMIT)
endef

names := elixir erlang golang nodejs python redis ruby rust terraform v

$(foreach name,$(names),$(name)):
	$(call fn_list_named,$@)

# Lazy but run once
all_terraform_versions = $(eval all_terraform_versions := $(shell asdf list-all terraform))$(all_terraform_versions)
list_terraform:
	@echo $(all_terraform_versions) | tr " " "\n" | grep -e '^0\.11\.' | tail -n 1 | sed -e 's/^/terraform /'
	@echo $(all_terraform_versions) | tr " " "\n" | grep -e '^0\.12\.' | tail -n 3 | sed -e 's/^/terraform /'

list:
	@echo "Installed:"
	@make -j 10 $(names)

all_versions := $(foreach erlang_version,$(erlang_versions),erlang_$(erlang_version))
all_versions += $(foreach elixir_version,$(elixir_versions),elixir_$(elixir_version))
all_versions += $(foreach nodejs_version,$(nodejs_versions),nodejs_$(nodejs_version))
all_versions += $(foreach golang_version,$(golang_versions),golang_$(golang_version))
all_versions += $(foreach python_version,$(python_versions),python_$(python_version))
all_versions += $(foreach redis_version,$(redis_versions),redis_$(redis_version))
all_versions += $(foreach ruby_version,$(ruby_versions),ruby_$(ruby_version))
all_versions += $(foreach rust_version,$(rust_versions),rust_$(rust_version))
all_versions += $(foreach terraform_version,$(terraform_versions),terraform_$(terraform_version))
all_versions += $(foreach v_version,$(v_versions),v_$(v_version))
plan:
	@echo $(all_versions) | sed "y/ /\n/"

# Define tasks such as golang_1.13.5
$(foreach task,$(all_versions),$(task)):
	asdf install $(subst _, ,$@)

install: $(all_versions)

set_globals:
	asdf global elixir $(firstword $(elixir_versions))
	asdf global erlang $(firstword $(erlang_versions))
	asdf global golang $(firstword $(golang_versions))
	asdf global nodejs $(firstword $(nodejs_versions))
	asdf global python $(firstword $(python_versions))
	asdf global ruby $(firstword $(ruby_versions))
	asdf global rust $(firstword $(rust_versions))
	asdf global v $(firstword $(v_versions))

plugins:
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
	@-asdf plugin-add ocaml           https://github.com/vic/asdf-ocaml.git               || true
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
	@-asdf plugin-add v
	@asdf plugin-update --all          >/dev/null