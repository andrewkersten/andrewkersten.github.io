cmd /c emcc source/dcpu.c -o obj/dcpu.bc -I include
cmd /c emcc source/interrupt_queue.c -o obj/interrupt_queue.bc -I include

cmd /c emcc obj/dcpu.bc obj/interrupt_queue.bc -Os -s WASM=1 -s SIDE_MODULE=1 -o ../demu.wasm
