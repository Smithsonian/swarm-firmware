all: swarm_network_registers.pdf

%.pdf : %.md
	pandoc -V geometry:margin=1in -o $@ $^

.PHONY: all
