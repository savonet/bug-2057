all:
	$(MAKE) -C files
	./test.liq

clean:
	$(MAKE) -C files $@
