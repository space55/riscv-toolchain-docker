all: build push
test: build pushtest

build:
	docker build -t space55/riscv-toolchain:local . --no-cache

push:
	docker tag space55/riscv-toolchain:local space55/riscv-toolchain:latest
	docker push space55/riscv-toolchain:latest

pushtest:
	docker tag space55/riscv-toolchain:local space55/riscv-toolchain:test
	docker push space55/riscv-toolchain:latest
