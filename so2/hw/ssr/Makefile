KDIR=/usr/src/linux-so2

all: kbuild testbuild

kbuild:
	make -C $(KDIR) M=`pwd`

testbuild:
	cd test && make -f Makefile.checker

clean:
	make -C $(KDIR) M=`pwd` clean
	cd test && make -f Makefile.checker clean
	rm -f ../../qemu-vm/fsimg/root/ssr.ko
	rm -f ../../qemu-vm/fsimg/root/mknodes.sh
	rm -f ../../qemu-vm/fsimg/root/cleandisks.sh
	rm -f ../../qemu-vm/fsimg/root/test.sh
	rm -f ../../qemu-vm/fsimg/root/run-test

deploy:
	cp ssr.ko ../../qemu-vm/fsimg/root/
	cp mknodes.sh ../../qemu-vm/fsimg/root/
	cp cleandisks.sh ../../qemu-vm/fsimg/root
	cp test.sh ../../qemu-vm/fsimg/root/
	cp test/_test/run-test ../../qemu-vm/fsimg/root/
	cd ../../qemu-vm/ && make
