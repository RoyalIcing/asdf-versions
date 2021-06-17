arch = $(shell arch)

erlang_versions := 24.0.2 23.3.4 22.3.4
elixir_versions := 1.12.1-otp-24 1.9.4

ifeq ($(arch), arm64)
golang_versions := 1.16.5
else
golang_versions := 1.16.5 1.13.15 1.14.11 1.12.10
endif
nodejs_versions := 14.16.1 12.21.0 15.14.0
deno_versions := 1.11.1
python_versions := 3.9.5 2.7.18
clojure_versions := 1.10.2.774
opam_versions := 2.0.8
redis_versions := 6.2.4
ruby_versions := 3.0.1 2.7.2
rust_versions := 1.52.1
terraform_versions := 1.0.0 0.12.29 0.11.14
v_versions := 0.2.2 
java_versions := adopt-openjdk-12.0.2+10.3
zig_versions := 0.8.0
sbcl_versions := 2.1.5
