# Include C file to compile.
{.compile: "funcs.c"}

# Bindings for our C Functions.
proc foo* : void {.importc: "foo", header: "funcs.h"}
proc bar*(input: cstring) : void {.importc: "bar", header: "funcs.h"}