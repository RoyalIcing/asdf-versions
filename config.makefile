arch = $(shell arch)

erlang_versions := 26.0.2
elixir_versions := 1.15.5-otp-26
gleam_versions := 0.30.1
nodejs_versions := 18.16.1
deno_versions := 1.36.1
bun_versions := 0.7.3
zig_versions := 0.11.0
rust_versions := 1.71.1
clojure_versions := 1.11.1.1403
redis_versions := 7.0.12
python_versions := 3.11.4
ruby_versions := 3.2.2
terraform_versions := 1.5.2
v_versions := 0.3.3
java_versions := adoptopenjdk-17.0.0+35
sbcl_versions := 2.3.0

ifeq ($(arch), arm64)
golang_versions := 1.21.0 1.18.4 1.17.8
opam_versions := 
swiprolog_versions :=
else
golang_versions := 1.21.0 1.18.4 1.17.8 1.13.15 1.14.11 1.12.10
opam_versions := 2.1.0
swiprolog_versions := 8.4.0
endif
