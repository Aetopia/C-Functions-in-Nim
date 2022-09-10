# C Functions in Nim
 
This repository shows a simple example of how to use C functions natively in Nim.

## What is Nim?
A language that is as fast as C, expressive as Python and extensible as Lisp.

### How is Nim is as fast as C?
To simply put, the Nim compiler more of indirectly compiles into machine code rather than directly.
This is because the Nim compiler translates Nim source code to C source code and that C source code is then compiled.
Thus, giving Nim, the speed of C.

# How to use C functions in Nim?

1. To begin, create a `.c` and `.h` file containing your functions.

    > **`funcs.h`**
    ```c
    #pragma once
    #include <stdio.h>

    // Prototypes
    void foo();
    void bar(char *input);
    ```

    > **`funcs.c`**
    ```c
    #include "funcs.h"

    void foo()
    {
        printf("No arguments passed from Nim > Hello from C!\n");
    }

    void bar(char *input)
    {
        printf("Argument passed from Nim > %s\n", input);
    }
    ```

2. Now, you need to create some bindings in Nim itself, here is an example:

    > **`binds.nim`**
    ```nim
    # Include C file to compile.
    {.compile: "funcs.c"}

    # Bindings for our C Functions.
    proc foo* : void {.importc: "foo", header: "funcs.h"}
    proc bar*(input: cstring) : void {.importc: "bar", header: "funcs.h"}
    ```
    1. `{.compile: "file.c"}` > Tells the Nim compiler to include this file during compilation.                 

    2. `{.importc: "func", header: "file.h"}` > Fetches the function itself. Assigning it to a procedure makes it usable in your Nim files.

3. Now, you can simply invoke those procedures like any other Nim procedure/function!
   
    ```nim
    # Fetch bindings
    import binds

    # Run Code.
    if isMainModule:
        foo() # -> void foo()
        bar("Hello from Nim!") # -> void bar(char *input)
    ```

4. Compile using:
   ```powershell
   nim --run -f c main.nim
   ```

5. Output
    ```
    No arguments passed from Nim > Hello from C!
    Argument passed from Nim > Hello from Nim!
    ```