FROM centos

MAINTAINER Hubert Asamer

RUN yum -y update && yum -y install epel-release && yum -y update && yum -y install python-pip jq bsdtar && pip install --upgrade pip  && pip install awscli certifi

COPY bin /root/bin

WORKDIR /root

CMD ["bin/in_s3_env", "bin/ingestS3"]

