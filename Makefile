ELIXIR_VERSION := 1.8.2
ERLANG_VERSION := 22.0.1
GOLANG_VERSION := 1.12.5
NODEJS_VERSION := 12.3.1
RUBY_VERSION := 2.6.3

default: list

list_elixir:
	@asdf list-all elixir | tail -n 3 | sed -e 's/^/elixir /'

list_erlang:
	@asdf list-all erlang | tail -n 3 | sed -e 's/^/erlang /'

list_golang:
	@asdf list-all golang | tail -n 3 | sed -e 's/^/golang /'

list_nodejs:
	@asdf list-all nodejs | tail -n 3 | sed -e 's/^/nodejs /'

list_ruby:
	@asdf list-all ruby | grep -e '^\d' | tail -n 6 | sed -e 's/^/ruby /'

list: list_elixir list_erlang list_golang list_nodejs list_ruby

install: install_elixir install_golang install_nodejs install_ruby

install_elixir:
	asdf install elixir $(ELIXIR_VERSION)

install_erlang:
	asdf install erlang $(ERLANG_VERSION)

install_golang:
	asdf install golang $(GOLANG_VERSION)

install_nodejs:
	asdf install nodejs $(NODEJS_VERSION)

install_ruby:
	asdf install ruby $(RUBY_VERSION)

set_globals:
	asdf global elixir $(ELIXIR_VERSION)
	asdf global erlang $(ERLANG_VERSION)
	asdf global golang $(GOLANG_VERSION)
	asdf global nodejs $(NODEJS_VERSION)
	asdf global ruby $(RUBY_VERSION)

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
	-asdf plugin-add rebar           https://github.com/Stratus3D/asdf-rebar
	-asdf plugin-add ruby            https://github.com/asdf-vm/asdf-ruby
	asdf plugin-update --all