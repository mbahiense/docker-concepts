FROM centos:7

RUN yum update -y
RUN yum install -y wget vim

#CMD ["ping", "127.0.0.1", "-c", "5"]
ENTRYPOINT ["ping", "-c", "5"]

CMD ["www.google.com.br"]
