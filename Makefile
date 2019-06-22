elixir_versions := 1.8.2
erlang_versions := 22.0.4
golang_versions := 1.12.6
nodejs_versions := 12.4.0 10.15.3
ruby_versions := 2.6.3 2.5.5
rust_versions := 1.35.0

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

list_rust:
	@asdf list-all rust | tail -n 3 | sed -e 's/^/rust /'

list: list_elixir list_erlang list_golang list_nodejs list_ruby list_rust

install: install_elixir install_erlang install_golang install_nodejs install_ruby install_rust

install_elixir:
	$(foreach elixir_version,$(elixir_versions),$(shell asdf install elixir $(elixir_version)))

install_erlang:
	$(foreach erlang_version,$(erlang_versions),$(shell asdf install erlang $(erlang_version)))

install_golang:
	$(foreach golang_version,$(golang_versions),$(shell asdf install golang $(golang_version)))

install_nodejs:
	$(foreach nodejs_version,$(nodejs_versions),$(shell asdf install nodejs $(nodejs_version)))

install_ruby:
	$(foreach ruby_version,$(ruby_versions),$(shell asdf install ruby $(ruby_version)))

install_rust:
	$(foreach rust_version,$(rust_versions),$(shell asdf install rust $(rust_version)))

set_globals:
	asdf global elixir $(firstword $(elixir_versions))
	asdf global erlang $(firstword $(erlang_versions))
	asdf global golang $(firstword $(golang_versions))
	asdf global nodejs $(firstword $(nodejs_versions))
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
	-asdf plugin-add rebar           https://github.com/Stratus3D/asdf-rebar
	-asdf plugin-add ruby            https://github.com/asdf-vm/asdf-ruby
	-asdf plugin-add rust            https://github.com/code-lever/asdf-rust.git
	asdf plugin-update --all