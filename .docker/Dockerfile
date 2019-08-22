FROM ubuntu:18.04
RUN apt-get update -y && apt-get install -y software-properties-common
RUN apt-get install -y build-essential python3 python3-venv python3-pip
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update -y && apt-get install -y default-jre
