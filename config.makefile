arch = $(shell arch)

erlang_versions := 24.2
elixir_versions := 1.13.1-otp-24

deno_versions := 1.17.2
clojure_versions := 1.10.3.1040
redis_versions := 6.2.6
ruby_versions := 3.0.3
rust_versions := 1.57.0
terraform_versions := 1.1.2
v_versions := 0.2.4
java_versions := adoptopenjdk-17.0.0+35
zig_versions := 0.9.0
sbcl_versions := 2.1.9

ifeq ($(arch), arm64)
golang_versions := 1.17.6
nodejs_versions := 16.13.1
python_versions := 3.10.1
opam_versions := 
swiprolog_versions :=
else
golang_versions := 1.17.6 1.13.15 1.14.11 1.12.10
nodejs_versions := 16.13.1 14.18.1 12.21.0
python_versions := 3.10.1 2.7.18
opam_versions := 2.1.0
swiprolog_versions := 8.4.0
endif
