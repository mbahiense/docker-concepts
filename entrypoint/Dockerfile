FROM centos:7

RUN yum update -y
RUN yum install -y wget vim

# default command to start container
# can override this with --entrypoint
ENTRYPOINT ["ping", "-c", "5"]

# inital arg to ping
CMD ["www.google.com.br"]
