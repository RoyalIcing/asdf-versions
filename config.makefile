arch = $(shell arch)

erlang_versions := 27.0
elixir_versions := 1.17.0-otp-27
gleam_versions := 1.2.1
golang_versions := 1.22.2 1.18.4 1.17.8
nodejs_versions := 20.12.0
deno_versions := 1.44.0
bun_versions := 1.1.12
zig_versions := 0.12.0
rust_versions := 1.78.0
clojure_versions := 1.11.3.1463
redis_versions := 7.2.4
python_versions := 3.10.13 3.12.3
postgres_versions := 16.0
ruby_versions := 3.3.2
terraform_versions := 1.7.4
v_versions := 0.3.3
java_versions := adoptopenjdk-17.0.0+35
sbcl_versions := 2.3.0

ifeq ($(arch), arm64)
opam_versions := 
swiprolog_versions :=
else
opam_versions := 2.1.0
swiprolog_versions := 8.4.0
endif
