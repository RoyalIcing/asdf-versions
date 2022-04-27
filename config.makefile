arch = $(shell arch)

erlang_versions := 24.3.3
elixir_versions := 1.13.4-otp-24
gleam_versions := 0.21.0
nodejs_versions := 16.14.2 18.0.0
deno_versions := 1.21.0
zig_versions := 0.9.1
rust_versions := 1.60.0
clojure_versions := 1.10.3.1087
redis_versions := 6.2.6
ruby_versions := 3.1.1
terraform_versions := 1.1.6
v_versions := 0.2.4
java_versions := adoptopenjdk-17.0.0+35
sbcl_versions := 2.2.2

ifeq ($(arch), arm64)
golang_versions := 1.18.1 1.17.8
python_versions := 3.10.4
opam_versions := 
swiprolog_versions :=
else
golang_versions := 1.18.1 1.17.8 1.13.15 1.14.11 1.12.10
python_versions := 3.10.4 2.7.18
opam_versions := 2.1.0
swiprolog_versions := 8.4.0
endif
