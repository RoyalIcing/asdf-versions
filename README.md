# Manage global asdf versions in one place

Versions are specified at the top of the provided Makefile. You can specify multiple versions of a package by listing them separated by a space

## List all recent versions

```
make
```

## Install all specified versions in parallel

```
make -j 10 install
```

## Change globals to latest

```
make set_globals
```
