# Manage global asdf versions in one place

Versions are specified in `config.makefile`.
You can specify multiple versions of a package by listing them separated by a space

```
erlang_versions := 23.2.1 22.3.4
elixir_versions := 1.11.3-otp-23 1.9.4
golang_versions := 1.13.15 1.15.6 1.14.11 1.12.10
nodejs_versions := 12.19.1 15.5.1
deno_versions := 1.6.3
python_versions := 3.9.1 2.7.18
clojure_versions := 1.10.1
opam_versions := 2.0.7
redis_versions := 6.0.9
ruby_versions := 2.7.2
rust_versions := 1.49.0
terraform_versions := 0.14.3 0.12.29 0.11.14
v_versions := 0.1.29
java_versions := adopt-openjdk-12.0.2+10.3
zig_versions := 0.7.1
```

## Pull latest, install everything, and set globals

```console
make
```

## List preferred and latest versions

```console
make list
```
