# OS Development

This repository is meant to be an educational dive into the development of an
operating system based on the x86_64 and Aarch64 architectures to learn the
differences between them. There is no expectation that this will be a helpful
piece of software as learning is the primary goal.

## Compiler Support

Supported compilers are meant to include Clang 18+ and the GCC 14+ toolchain.
As such, the recommended development environments are either MacOS, a Linux
distribution, or Cygwin within a Windows installation. Tested versions of the
compilers include Clang 18+ and GCC 14+.

## Development Environment

To get started, a few packages will need to be installed on the local system.
The simplest path to compilation will be `clang` which is natively built to be
a cross-compiler:

### MacOS

```bash
brew install llvm
```

### OpenSuse

```bash
sudo zypper install clang
```

Now that assembling, compilation, linking, and remote debugging are taken care
of, we can configure our system to be able to run the operating system. For
initial development, the targets are virtualized aarch64 systems via QEmu.
Installation of the virtualization software is done via:

### MacOS

```bash
brew install qemu
```

### OpenSuse

```bash
sudo zypper install qemu
```

## Execution

The following commands will execute the operating system in a virtual machine:

```bash
make clean
make
make run
```
