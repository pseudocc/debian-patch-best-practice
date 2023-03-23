RLIB=target/release/libdebian_patch_best_practice.rlib

all: ${RLIB}

${RLIB}:
	cargo build --release

install: ${RLIB}
	install -d /usr/lib/
	install ${RLIB} /usr/lib/libdpbp_add.rlib

clean:
	rm -rf target Cargo.lock
