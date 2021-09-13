arch = $(shell arch)

erlang_versions := 24.0.6 23.3.4 22.3.4
elixir_versions := 1.12.3-otp-24

ifeq ($(arch), arm64)
golang_versions := 1.17.1
else
golang_versions := 1.17.1 1.13.15 1.14.11 1.12.10
endif
nodejs_versions := 14.17.5 12.21.0 15.14.0
deno_versions := 1.13.2
python_versions := 3.9.7 2.7.18
clojure_versions := 1.10.3.967
opam_versions := 2.1.0
redis_versions := 6.2.5
ruby_versions := 3.0.2 2.7.2
rust_versions := 1.54.0
terraform_versions := 1.0.5 0.12.29 0.11.14
v_versions := 0.2.4
java_versions := adopt-openjdk-12.0.2+10.3
zig_versions := 0.8.1
sbcl_versions := 2.1.7
