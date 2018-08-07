#!/bin/bash
# pspsdk-stage1.sh by Dan Peori (danpeori@oopo.net)

 ## Exit on errors
 set -e

 ## Download the source code if it does not already exist.
 clone_git_repo github.com AlanFlaherty pspsdk stable

 ## Enter the source directory.
 cd pspsdk

 ## Bootstrap the source.
 ./bootstrap

 ## Configure the build.
 CFLAGS="$CFLAGS -I/opt/local/include" CPPFLAGS="$CPPFLAGS -I/opt/local/include" LDFLAGS="$LDFLAGS -L/opt/local/lib" ./configure --with-pspdev="$PSPDEV"

 ## Build and install.
 make -j $(num_cpus) clean
 make -j $(num_cpus) install-data
 make -j $(num_cpus) clean
