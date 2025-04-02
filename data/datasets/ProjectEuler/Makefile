INPUTS = $(wildcard original_c/*.c)
ARMOUTPUTS = $(patsubst original_c/%.c,target_arm/%.arm.s,$(INPUTS))
RISCOUTPUTS = $(patsubst original_c/%.c,target_risc/%.risc.s,$(INPUTS))

VERBOSEARMOUTPUTS = $(patsubst original_c/%.c,target_arm/%.verbose_arm.s,$(INPUTS))
VERBOSERISCOUTPUTS = $(patsubst original_c/%.c,target_risc/%.verbose_risc.s,$(INPUTS))

%.arm.s : %.c
	aarch64-linux-gnu-gcc -I/usr/local/include/ -S $< -o $@

%.risc.s : %.c
	riscv64-linux-gnu-gcc -I/usr/local/include/ -S $< -o $@

%.verbose_arm.s : %.c
	aarch64-linux-gnu-gcc -I/usr/local/include/ -S $< -o $@ -fverbose-asm -lm -lgmp

%.verbose_risc.s : %.c
	riscv64-linux-gnu-gcc -I/usr/local/include/ -I/usr/riscv64-linux-gnu/include/ -I/usr/include/aarch64-linux-gnu/ -S $< -o $@ -fverbose-asm -lm -lgmp

all: $(ARMOUTPUTS) $(RISCOUTPUTS) 
verbose: $(VERBOSEARMOUTPUTS) $(VERBOSERISCOUTPUTS)
