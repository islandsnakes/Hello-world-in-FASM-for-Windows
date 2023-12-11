format PE console
entry start

include 'win32a.inc'


section '.data' data readable writeable
        msg db 'Hello, world!', 0


section '.text' executable
start:
        invoke GetStdHandle, -11
        invoke WriteConsoleA, eax, msg, 13, 0, 0
        invoke ExitProcess, 0


section '.idata' data readable import
        library kernel32, 'kernel32.dll'
        import kernel32,\
               GetStdHandle, 'GetStdHandle',\
               WriteConsoleA, 'WriteConsoleA',\
               ExitProcess, 'ExitProcess'