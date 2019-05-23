elixir_versions := 1.8.2
erlang_versions := 22.0.1
golang_versions := 1.12.5
nodejs_versions := 12.3.1
ruby_versions := 2.6.3 2.5.5

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

list_ruby:
	@asdf list-all ruby 2>/dev/null | grep -e '^\d\.\d\.\d$$' | tail -n 6 | sed -e 's/^/ruby /'

list: list_elixir list_erlang list_golang list_nodejs list_ruby

install: install_elixir install_erlang install_golang install_nodejs install_ruby

install_elixir:
	$(foreach elixir_version,$(elixir_versions),asdf install elixir $(elixir_version))

install_erlang:
	$(foreach erlang_version,$(erlang_versions),asdf install erlang $(erlang_version))

install_golang:
	$(foreach golang_version,$(golang_versions),asdf install golang $(golang_version))

install_nodejs:
	$(foreach nodejs_version,$(nodejs_versions),asdf install nodejs $(nodejs_version))

install_ruby:
	$(foreach ruby_version,$(ruby_versions),asdf install ruby $(ruby_version))

set_globals:
	asdf global elixir $(lastword $(elixir_versions))
	asdf global erlang $(lastword $(erlang_versions))
	asdf global golang $(lastword $(golang_versions))
	asdf global nodejs $(lastword $(nodejs_versions))
	asdf global ruby $(lastword $(ruby_versions))

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