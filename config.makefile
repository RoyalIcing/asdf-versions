arch = $(shell arch)

erlang_versions := 25.1.1
elixir_versions := 1.14.0-otp-25
gleam_versions := 0.25.0
nodejs_versions := 16.16.0 18.8.0
deno_versions := 1.28.2
bun_versions := 0.2.2
zig_versions := 0.9.1
rust_versions := 1.65.0
clojure_versions := 1.10.3.1087
redis_versions := 7.0.5
ruby_versions := 3.1.2
terraform_versions := 1.2.8
v_versions := 0.3
java_versions := adoptopenjdk-17.0.0+35
sbcl_versions := 2.2.5

ifeq ($(arch), arm64)
golang_versions := 1.19.1 1.18.4 1.17.8
python_versions := 3.10.6
opam_versions := 
swiprolog_versions :=
else
golang_versions := 1.19.1 1.18.4 1.17.8 1.13.15 1.14.11 1.12.10
python_versions := 3.10.6 2.7.18
opam_versions := 2.1.0
swiprolog_versions := 8.4.0
endif
