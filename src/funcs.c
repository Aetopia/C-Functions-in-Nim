#include "funcs.h"

void foo()
{
    printf("No arguments passed from Nim > Hello from C!\n");
}

void bar(char *input)
{
    printf("Argument passed from Nim > %s\n", input);
}
