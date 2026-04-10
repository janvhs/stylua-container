#
#  Copyright (c) 2026 Jan Fooken
#
#  Containerfile
#
#  JohnnyMorganz' StyLua as an usable OCI container
#
#  SPDX-License-Identifier: BSD-2-Clause
#

ARG STYLUA_VERSION=latest

FROM docker.io/johnnymorganz/stylua:${STYLUA_VERSION} AS stylua

FROM gcr.io/distroless/cc

LABEL org.opencontainers.image.source=https://github.com/janvhs/stylua-container
LABEL org.opencontainers.image.description="StyLua as executable container image"
LABEL org.opencontainers.image.licenses=BSD-2-Clause

COPY --from=stylua /stylua /usr/bin/stylua

VOLUME ["/data"]

ENTRYPOINT ["stylua"]

CMD ["/data"]
