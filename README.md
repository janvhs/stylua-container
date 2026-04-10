# StyLua Container

The StyLua you know and love now in container form for quick execution

## Run

```sh
# Using Apple's container tool
container run --rm -it -v ".:/data" ghcr.io/janvhs/stylua:2.4.1
```

## Build

To build the container just run `make`.  Please refer to the
[Makefile](./Makefile) to learn what variables can be customised.

```sh
make
```

## License

This software is licensed under the BSD 2-Clause "Simplified" License.  Please
refer to the [COPYRIGHT](./COPYRIGHT) file to learn more.
