FROM centos:7
ENV  ES_HOME=/opt/elasticsearch \
     PATH=/opt/elasticsearch/bin:$PATH
EXPOSE 9200 9300
COPY ./stack/elasticsearch-8.6.2-linux-x86_64.tar.* /opt/
WORKDIR /opt
RUN  yum install -y perl-Digest-SHA && \
     cat elasticsearch-8.6.2-linux-x86_64.tar.gz.sha512 |  shasum -a 512 -c - && \
     tar -xzf elasticsearch-8.6.2-linux-x86_64.tar.gz && \
     mv elasticsearch-8.6.2 elasticsearch && \
     rm -f elasticsearch-8.6.2-linux-x86_64.* && \
     yum remove -y perl-Digest-SHA && \
     yum clean all && \
     mkdir /var/lib/data && \
     mkdir /var/lib/logs && \
     mkdir /opt/elasticsearch/snapshots && \
     adduser elsuser && \
     chown -R elsuser:elsuser /var/lib/data && \
     chown -R elsuser:elsuser /var/lib/logs && \
     chown -R elsuser:elsuser /opt/elasticsearch

COPY --chown=elsuser:elsuser ./stack/elasticsearch.yml /opt/elasticsearch/config/
USER 1000
WORKDIR ${ES_HOME}/bin
CMD ["elasticsearch"]