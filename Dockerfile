FROM alpine:3.12.0

RUN \
      apk update && \
      apk upgrade && \
      apk add wget ca-certificates perl perl-dev perl-app-cpanminus libressl libressl-dev zlib-dev gcc build-base gnupg tzdata postgresql-dev

RUN cpanm aliased Devel::Dwarn Mojolicious Mojolicious::Plugin::Status List::MoreUtils Mojo::JWT Mojo::Pg
