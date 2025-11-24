arch = $(shell arch)

erlang_versions := 28.1.1
elixir_versions := 1.19.2-otp-28
gleam_versions := 1.13.0
golang_versions := 1.25.3 1.18.4 1.17.8
nodejs_versions := 22.12.0
deno_versions := 2.5.4
bun_versions := 1.3.2
zig_versions := 0.15.2
rust_versions := 1.91.1
clojure_versions := 1.12.1.1550
redis_versions := 7.4.1
python_versions := 3.13.3 3.12.4
postgres_versions := 16.0
ruby_versions := 3.4.7
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
