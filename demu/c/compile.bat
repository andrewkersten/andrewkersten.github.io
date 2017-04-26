cmd /c emcc source/dcpu.c -o obj/dcpu.bc -I include
cmd /c emcc source/interrupt_queue.c -o obj/interrupt_queue.bc -I include
cmd /c emcc source/lem1802.c -o obj/lem1802.bc -I include
cmd /c emcc source/clock.c -o obj/clock.bc -I include

cmd /c emcc obj/dcpu.bc obj/interrupt_queue.bc obj/lem1802.bc obj/clock.bc -Os -s WASM=1 -s SIDE_MODULE=1 -o ../demu.wasm

cmd /c C:\library\web\wabt\build\Debug\wasm2wast.exe ../demu.wasm -o ../demu.wast
