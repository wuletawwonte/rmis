# Install build-essentials

Based on the documentation provided in the [official repository of dev-tld-resolver](https://github.com/puma/dev-tld-resolver) it is an open source linux package built using `C`. 

We use `make` command to build the application from its source code. And the make command is one of the five packages found inside a meta package called `build-essentials`.

## How to install build essentials on ubuntu
Install any pending updates for your existing packages with the update and upgrade commands:
```bash
sudo apt update && sudo apt upgrade -y
```
To install build-essentials, you can use the following command:
```bash
sudo apt install build-essential
```
> Intalling `build-essential` meta package will install `dpkg-dev`, `make`, `libc6-dev` and `gcc/g++` packages.

Finally, install `dev-tld-resolver` based on the [Installation section](https://github.com/puma/dev-tld-resolver#installation) on the README of its GitHub repository. 