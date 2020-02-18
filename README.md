# Manage global asdf versions in one place

Versions are specified at the top of the provided Makefile. You can specify multiple versions of a package by listing them separated by a space

```
erlang_versions := 22.2.6
elixir_versions := 1.10.1-otp-22 1.8.2 1.9.4
golang_versions := 1.13.8 1.12.10
nodejs_versions := 12.15.0 10.15.3
python_versions := 3.8.1 2.7.16
redis_versions := 5.0.5
ruby_versions := 2.6.5 2.7.0
rust_versions := 1.41.0 1.35.0
terraform_versions := 0.12.20 0.11.14
…
```

## List all recent versions

```
make
```

Will output something like:
```
=> elixir 1.10.1-otp-22 1.8.2 1.9.4
=> erlang 22.2.6
=> golang 1.13.8 1.12.10
=> nodejs 12.15.0 10.15.3
=> python 3.8.1 2.7.16
=> ruby 2.6.5 2.5.5
=> redis 5.0.5
=> rust 1.41.0 1.35.0
=> terraform 0.12.20 0.11.14
   elixir 1.10.0-otp-21
   elixir 1.10.0-otp-22
   elixir 1.10.1
   elixir 1.10.1-otp-21
   elixir 1.10.1-otp-22
   python 3.7.5
   python 3.7.5rc1
   python 3.7.6
   python 3.8.0
   python 3.8.1
   terraform 0.12.16
   terraform 0.12.17
   terraform 0.12.18
   terraform 0.12.19
   terraform 0.12.20
   ruby 2.7.0-preview2
   ruby 2.7.0-preview3
   ruby 2.7.0-rc1
   ruby 2.7.0-rc2
   ruby 2.7.0
   rust 1.37.0
   rust 1.38.0
   rust 1.39.0
   rust 1.40.0
   rust 1.41.0
   redis 5.0.3
   redis 5.0.4
   redis 5.0.5
   redis 5.0.6
   redis 5.0.7
   nodejs 13.4.0
   nodejs 13.5.0
   nodejs 13.6.0
   nodejs 13.7.0
   nodejs 13.8.0
   erlang 22.2.2
   erlang 22.2.3
   erlang 22.2.4
   erlang 22.2.5
   erlang 22.2.6
   golang 1.13.4
   golang 1.13.5
   golang 1.13.6
   golang 1.13.7
   golang 1.13.8
```

## Install all specified versions in parallel

```
make -j 10 install
```

## Change asdf globals to first specified

```
make set_globals
```

Runs `asdf global plugin_name version` behind the scene for each plugin setting it to the first version specified.
