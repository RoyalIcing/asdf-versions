elixir_versions := 1.8.2 1.9.1
erlang_versions := 22.1
golang_versions := 1.13.3 1.12.10
nodejs_versions := 12.8.1 10.15.3
python_versions := 3.7.4 2.7.16
redis_versions := 5.0.5
ruby_versions := 2.6.5 2.5.5
rust_versions := 1.38.0 1.35.0
terraform_versions := 0.12.10 0.11.14

default:
	@make -j 10 list

list_elixir:
	@asdf list-all elixir | tail -n 3 | sed -e 's/^/elixir /'

list_erlang:
	@asdf list-all erlang | tail -n 3 | sed -e 's/^/erlang /'

list_golang:
	@asdf list-all golang | tail -n 3 | sed -e 's/^/golang /'

list_nodejs:
	@asdf list-all nodejs | tail -n 3 | sed -e 's/^/nodejs /'

# Lazy but run once
all_python_versions = $(eval all_python_versions := $(shell asdf list-all python))$(all_python_versions)
list_python:
	@echo $(all_python_versions) | tr " " "\n" | grep -e '^3\.' | tail -n 5 | sed -e 's/^/python /'

list_redis:
	@asdf list-all redis | tail -n 3 | sed -e 's/^/redis /'

list_ruby:
	@asdf list-all ruby 2>/dev/null | grep -e '^\d\.\d\.\d$$' | tail -n 6 | sed -e 's/^/ruby /'

list_rust:
	@asdf list-all rust | tail -n 3 | sed -e 's/^/rust /'

# Lazy but run once
all_terraform_versions = $(eval all_terraform_versions := $(shell asdf list-all terraform))$(all_terraform_versions)
list_terraform:
	@echo $(all_terraform_versions) | tr " " "\n" | grep -e '^0\.11\.' | tail -n 1 | sed -e 's/^/terraform /'
	@echo $(all_terraform_versions) | tr " " "\n" | grep -e '^0\.12\.' | tail -n 3 | sed -e 's/^/terraform /'

list: list_elixir list_erlang list_golang list_nodejs list_python list_redis list_ruby list_rust list_terraform

all_versions := $(foreach erlang_version,$(erlang_versions),erlang_$(erlang_version))
all_versions += $(foreach elixir_version,$(elixir_versions),elixir_$(elixir_version))
all_versions += $(foreach nodejs_version,$(nodejs_versions),nodejs_$(nodejs_version))
all_versions += $(foreach golang_version,$(golang_versions),golang_$(golang_version))
all_versions += $(foreach python_version,$(python_versions),python_$(python_version))
all_versions += $(foreach redis_version,$(redis_versions),redis_$(redis_version))
all_versions += $(foreach ruby_version,$(ruby_versions),ruby_$(ruby_version))
all_versions += $(foreach rust_version,$(rust_versions),rust_$(rust_version))
all_versions += $(foreach terraform_version,$(terraform_versions),terraform_$(terraform_version))
list_versions:
	echo $(all_versions)

$(foreach full,$(all_versions),$(full)):
	asdf install $(subst _, ,$@)

elixir: $(foreach elixir_version,$(elixir_versions),elixir_$(elixir_version))
python: $(foreach python_version,$(python_versions),python_$(python_version))

install: $(foreach full,$(all_versions),$(full))

set_globals:
	asdf global elixir $(firstword $(elixir_versions))
	asdf global erlang $(firstword $(erlang_versions))
	asdf global golang $(firstword $(golang_versions))
	asdf global nodejs $(firstword $(nodejs_versions))
	asdf global python $(firstword $(python_versions))
	asdf global ruby $(firstword $(ruby_versions))
	asdf global rust $(firstword $(rust_versions))

plugins:
	-asdf plugin-add clojure         https://github.com/halcyon/asdf-clojure.git
	-asdf plugin-add crystal         https://github.com/marciogm/asdf-crystal.git
	-asdf plugin-add dep             https://github.com/paxosglobal/asdf-dep
	-asdf plugin-add elixir          https://github.com/asdf-vm/asdf-elixir
	-asdf plugin-add elm             https://github.com/vic/asdf-elm.git
	-asdf plugin-add erlang          https://github.com/asdf-vm/asdf-erlang.git
	-asdf plugin-add golang          https://github.com/kennyp/asdf-golang.git
	-asdf plugin-add haskell         https://github.com/vic/asdf-haskell.git
	-asdf plugin-add java            https://github.com/skotchpine/asdf-java.git
	-asdf plugin-add nodejs          https://github.com/asdf-vm/asdf-nodejs.git
	-asdf plugin-add ocaml           https://github.com/vic/asdf-ocaml.git
	-asdf plugin-add postgres        https://github.com/smashedtoatoms/asdf-postgres
	-asdf plugin-add python          https://github.com/danhper/asdf-python.git
	-asdf plugin-add rebar           https://github.com/Stratus3D/asdf-rebar
	-asdf plugin-add redis           https://github.com/smashedtoatoms/asdf-redis.git
	-asdf plugin-add ruby            https://github.com/asdf-vm/asdf-ruby
	-asdf plugin-add rust            https://github.com/code-lever/asdf-rust.git
	-asdf plugin-add consul          https://github.com/Banno/asdf-hashicorp.git
	-asdf plugin-add packer          https://github.com/Banno/asdf-hashicorp.git
	-asdf plugin-add terraform       https://github.com/Banno/asdf-hashicorp.git
	-asdf plugin-add vault           https://github.com/Banno/asdf-hashicorp.git
	asdf plugin-update --all