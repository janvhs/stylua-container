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

COPY --from=stylua /stylua /usr/bin/stylua

VOLUME ["/data"]

ENTRYPOINT ["stylua"]

CMD ["/data"]
