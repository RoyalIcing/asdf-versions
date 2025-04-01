arch = $(shell arch)

erlang_versions := 27.3.1
elixir_versions := 1.18.2-otp-27
gleam_versions := 1.7.0
golang_versions := 1.24.0 1.18.4 1.17.8
nodejs_versions := 22.12.0
deno_versions := 2.2.2
bun_versions := 1.2.4
zig_versions := 0.13.0
rust_versions := 1.85.0
clojure_versions := 1.12.0.1495
redis_versions := 7.4.1
python_versions := 3.10.13 3.12.4
postgres_versions := 16.0
ruby_versions := 3.4.1
terraform_versions := 1.9.3
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
