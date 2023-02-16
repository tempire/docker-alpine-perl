FROM alpine:3.17.0
RUN echo "ulimit is $(ulimit -n)"

RUN apk update && \
    apk upgrade && \
    apk add perl perl-list-moreutils perl-cpanel-json-xs perl-devel-stacktrace perl-time-hires perl-role-tiny perl-io-socket-ssl tzdata perl-xml-libxml perl-crypt-cbc perl-crypt-jwt perl-xml-libxml perl-crypt-openssl-x509 perl-datetime jq

RUN apk add --virtual .build-deps wget perl-dev perl-app-cpanminus build-base gnupg cmake \
  && cpanm \
      aliased \
      Devel::Dwarn \
      Future::AsyncAwait \
      Syntax::Keyword::Try \
      YAML::XS \
      Digest::SHA \
      EV \
      Net::DNS::Native \
      Crypt::Cipher::AES \
    && \
    cpanm https://cpan.metacpan.org/authors/id/C/CG/CGPAN/Math-Random-MTwist-0.23.tar.gz && \
    apk del .build-deps && \
    rm -rf /root/.cpanm

      #Math::Random::MTwist \

ENV ENV="/root/.ashrc"

RUN echo 'export PS1="🐳 \e[0;34;1m$HOSTNAME\e[0m \w # "' >> "$ENV"
RUN echo 'alias ll="ls -Fals"' >> "$ENV"
