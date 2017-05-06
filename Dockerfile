FROM ubuntu:16.04

EXPOSE 8000

RUN apt update && apt -y upgrade && apt -y install \
    software-properties-common \
    build-essential \
    openssh-client \
    vim \
    curl

# Install Java 8
RUN add-apt-repository -y ppa:webupd8team/java &&  \
    apt-get -y update && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
    apt-get -y install oracle-java8-installer && \
    apt-get -y install oracle-java8-set-default

# Get the package from Amazon
RUN wget -O /tmp/dynamodb_local_latest https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz && \
    tar -xvf /tmp/dynamodb_local_latest && \

CMD java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb
