#pragma once

#include "dcpu.h"
#include "hardware.h"

void lem1802_initialize(HARDWARE hardware);

void lem1802_write_texture(HARDWARE hardware, DCPU dcpu, char* texture_data);
