# vi: ft=dockerfile

FROM dpirotte/fpm-cookery:jessie

RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
  d-shlibs \
  debian-keyring \
  devscripts \
  equivs \
  packaging-dev \
&& rm -rf /var/lib/apt/lists/*

