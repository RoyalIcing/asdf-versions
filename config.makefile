arch = $(shell arch)

erlang_versions := 27.0.1
elixir_versions := 1.17.2-otp-27
gleam_versions := 1.3.2
golang_versions := 1.22.4 1.18.4 1.17.8
nodejs_versions := 20.15.1
deno_versions := 1.45.3
bun_versions := 1.1.20
zig_versions := 0.13.0
rust_versions := 1.80.0
clojure_versions := 1.11.3.1463
redis_versions := 7.2.5
python_versions := 3.10.13 3.12.4
postgres_versions := 16.0
ruby_versions := 3.3.3
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
