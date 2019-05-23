# Manage global asdf versions in one place

Versions are specified at the top of the provided Makefile. You can specify multiple versions of a package by listing them separated by a space

```
elixir_versions := 1.8.2
erlang_versions := 22.0.1
golang_versions := 1.12.5
nodejs_versions := 12.3.1
ruby_versions := 2.6.3 2.5.5
…
```

## List all recent versions

```
make
```

Will output something like:
```
nodejs 12.2.0
nodejs 12.3.0
nodejs 12.3.1
erlang 22.0-rc2
erlang 22.0-rc3
erlang 22.0.1
elixir 1.8.0
elixir 1.8.1
elixir 1.8.2
ruby 2.5.4
ruby 2.5.5
ruby 2.6.0
ruby 2.6.1
ruby 2.6.2
ruby 2.6.3
golang 1.12.3
golang 1.12.4
golang 1.12.5
```

## Install all specified versions in parallel

```
make -j 10 install
```

## Change globals to first specified

```
make set_globals
```

Runs `asdf global plugin_name version` behind the scene for each plugin setting it to the first version specified.
