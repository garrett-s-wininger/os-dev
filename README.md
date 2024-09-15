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
a cross-compiler (though it does use a native linker):

### MacOS

```bash
brew install cmake llvm
```

### OpenSuse

```bash
sudo zypper install clang cmake gcc
```

Now that assembling, compilation, linking, and remote debugging are taken care
of, we can configure our system to be able to run the operating system. For
initial development, the targets are virtualized aarch64 and x86 systems via
QEmu. Installation of the virtualization software is done via:

### MacOS

```bash
brew install qemu
```

### OpenSuse

```bash
sudo zypper install qemu
```

### Alternative Environments or Toolchains

Should the compiler of choice not be available within the repo, a user-specifc
`CMakeUserPresets.json` can be created and referenced when initially configuring
the project. This file will not be version contarolled to ensure that the config
doesn't step on other, user-level settings, however, common settings can easily
be moved to the project level presets for others to take advantage of.

## Execution

The following commands will execute the operating system in a virtual machine:

```bash
cmake --preset (x86|aarch64)-kernel ./
make (x86|aarch64)-emulate
```
