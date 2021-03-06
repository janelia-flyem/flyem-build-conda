#!/bin/bash

if [[ $(uname) == Darwin ]]; then
    EXT=dylib
else
    EXT=so
fi

# Build
make

# Install headers
mkdir -p ${PREFIX}/include
cp -r include/leveldb ${PREFIX}/include

# Install lib (with symlinks)
mkdir -p ${PREFIX}/lib
cp libleveldb.${EXT}.1.9 ${PREFIX}/lib/
cd ${PREFIX}/lib/ && ln -s libleveldb.${EXT}.1.9 libleveldb.${EXT}.1 && cd -
cd ${PREFIX}/lib/ && ln -s libleveldb.${EXT}.1 libleveldb.${EXT} && cd -
