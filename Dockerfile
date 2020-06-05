FROM python:3.8.3
ENV TA_LIB_VERSION=0.4.0

RUN set -ex \
      \
      && pip install numpy \
      && wget -O ta-lib.tar.gz "http://prdownloads.sourceforge.net/ta-lib/ta-lib-$TA_LIB_VERSION-src.tar.gz" \
      && mkdir -p /opt/src/ta-lib \
      && tar -xzC /opt/src/ta-lib --strip-components=1 -f ta-lib.tar.gz \
      && rm ta-lib.tar.gz \
      && cd /opt/src/ta-lib \
      && ./configure --prefix=/usr \
      && make \
      && make install \
      && rm -R /opt/src/ta-lib

WORKDIR /app/build
CMD ["python3"]
