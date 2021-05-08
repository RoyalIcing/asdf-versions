arch = $(shell arch)

erlang_versions := 23.3.2 22.3.4
elixir_versions := 1.11.4-otp-23 1.9.4

ifeq ($(arch), arm64)
golang_versions := 1.16.2
else
golang_versions := 1.15.8 1.13.15 1.14.11 1.12.10
endif
nodejs_versions := 14.16.1 12.21.0 15.14.0
deno_versions := 1.9.0
python_versions := 3.9.4 2.7.18
clojure_versions := 1.10.2.774
opam_versions := 2.0.8
redis_versions := 6.2.1
ruby_versions := 3.0.1 2.7.2
rust_versions := 1.51.0
terraform_versions := 0.14.10 0.12.29 0.11.14
v_versions := 0.2.2 
java_versions := adopt-openjdk-12.0.2+10.3
zig_versions := 0.7.1
sbcl_versions := 2.1.3
