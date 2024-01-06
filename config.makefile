arch = $(shell arch)

erlang_versions := 26.2.1
elixir_versions := 1.15.7-otp-26
gleam_versions := 0.33.0
golang_versions := 1.21.5 1.18.4 1.17.8
nodejs_versions := 20.10.0
deno_versions := 1.39.2
bun_versions := 1.0.21
zig_versions := 0.11.0
rust_versions := 1.75.0
clojure_versions := 1.11.1.1429
redis_versions := 7.2.3
python_versions := 3.10.13 3.12.1
ruby_versions := 3.3.0
terraform_versions := 1.6.6
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
