arch = $(shell arch)

erlang_versions := 25.2.2
elixir_versions := 1.14.3-otp-25
gleam_versions := 0.25.3
nodejs_versions := 18.13.0
deno_versions := 1.30.2
bun_versions := 0.5.5
zig_versions := 0.10.1
rust_versions := 1.67.0
clojure_versions := 1.11.1.1208
redis_versions := 7.0.8
python_versions := 3.11.1
ruby_versions := 3.2.0
terraform_versions := 1.3.7
v_versions := 0.3.3
java_versions := adoptopenjdk-17.0.0+35
sbcl_versions := 2.3.0

ifeq ($(arch), arm64)
golang_versions := 1.20 1.18.4 1.17.8
opam_versions := 
swiprolog_versions :=
else
golang_versions := 1.20 1.18.4 1.17.8 1.13.15 1.14.11 1.12.10
opam_versions := 2.1.0
swiprolog_versions := 8.4.0
endif
