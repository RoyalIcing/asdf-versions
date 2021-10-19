arch = $(shell arch)

erlang_versions := 24.1.2
elixir_versions := 1.12.3-otp-24

ifeq ($(arch), arm64)
golang_versions := 1.17.2
nodejs_versions := 16.11.1
python_versions := 3.10.0
opam_versions := 
else
golang_versions := 1.17.2 1.13.15 1.14.11 1.12.10
nodejs_versions := 14.18.1 12.21.0 15.14.0
python_versions := 3.10.0 2.7.18
opam_versions := 2.1.0
endif
deno_versions := 1.14.3
clojure_versions := 1.10.3.986
redis_versions := 6.2.6
ruby_versions := 3.0.2 2.7.2
rust_versions := 1.55.0
terraform_versions := 1.0.8
v_versions := 0.2.4
java_versions := adoptopenjdk-17.0.0+35
zig_versions := 0.8.1
sbcl_versions := 2.1.7
swiprolog_versions := 8.4.0
