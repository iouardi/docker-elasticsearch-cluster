# Pull base image.
FROM elasticsearch:1.5
MAINTAINER Issam Ouardi <iss.ouardi@gmail.com>

RUN apt-get update && apt-get -y upgrade
# Install system dependencies
RUN apt-get install -y supervisor


# Install elasticsearch cloud aws plugin
RUN cd /usr/share/elasticsearch/ \
	&& bin/plugin -install elasticsearch/elasticsearch-cloud-aws/2.5.0 \
	&& bin/plugin -install lmenezes/elasticsearch-kopf/1.4.7


ENV ES_CLUSTER_NAME false
ENV ES_AWS_REGION us-central-1


#ADD config/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
# Add supervisord configuration
ADD config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD scripts/config.sh /usr/local/config.sh
ADD scripts/es-start /usr/local/bin/

RUN chmod +x /usr/local/config.sh
RUN chmod +x /usr/local/bin/es-start

CMD ["es-start"]