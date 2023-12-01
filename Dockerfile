FROM amazoncorretto:21-al2023

RUN yum update &&  \
    yum -y install nodejs npm

RUN npm install -g aws-cdk

COPY --chmod=0755 entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
