FROM consul:1.12.2
LABEL image.version=$consul-VERSION \
      image.authors="Martial AGBANGLA" \
      name="consul" \
      maintainer="AGBANGLA Martial <amour.martial@gmail.com>" \
      vendor="HashiCorp" \
      version=$consul-VERSION \
      release=$consul-VERSION \
      summary="This image is built for la in loto-quebec network." \
      description="Consul is a datacenter runtime that provides service discovery, configuration, and orchestration."

RUN mkdir -p /etc/tls/ca
RUN mkdir -p /etc/tls/certs
COPY configs/consul-s1/consul_s1.json /consul/config/
COPY configs/consul-s1/tls-config.json /consul/config/
COPY configs/consul-s1/*.pem /etc/tls/certs/
COPY configs/consul-s1/*.pem /etc/tls/ca/
#RUN chmod -R 777 /etc/tls/
RUN chown -R consul:consul /etc/tls