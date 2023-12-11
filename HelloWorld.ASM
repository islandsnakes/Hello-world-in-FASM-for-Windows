format PE console      ;Determine program format
entry start            ;Entry point to the program

include 'win32a.inc'   ;Adding WIN32A.INC for convenient work under Windows


section '.data' data readable writeable    ;Defining a data section
        msg db 'Hello, world!', 0          ;line Hello, world!


section '.text' executable                 ;Define the section of executable code
start:                                     ;Start label
        invoke GetStdHandle, -11                                ;Retrieves a handle for the specified standard device (-11 standart output)
        invoke WriteConsoleA, eax, msg, 13, 0, 0                ;Print the line Hello, world! to the console.
        invoke ExitProcess, 0                                   ;Exit the program


section '.idata' data readable import              ;Defining the Import Section
        library kernel32, 'kernel32.dll'           ;Include the KERNEL32.DLL
        import kernel32,\                          ;Import the following functions from KERNEL32.DLL
               GetStdHandle, 'GetStdHandle',\           ;Import GetStdHandle function
               WriteConsoleA, 'WriteConsoleA',\         ;Import WriteConsoleA function
               ExitProcess, 'ExitProcess'               ;Import ExitProcess function
