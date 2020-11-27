FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y wget git unzip vim && \
    rm -rf /var/lib/apt/lists/*

# Extract Asphyxia CORE
RUN mkdir /core && \
  cd /core && \
  wget https://github.com/asphyxia-core/asphyxia-core.github.io/releases/download/release/asphyxia-core-linux-x64.zip && \
  unzip asphyxia-core-linux-x64.zip && \
  chmod +x asphyxia-core-linux-x64 && \
  rm -rf asphyxia-core-linux-x64.zip
WORKDIR /core

# Extract SDVX plugin
RUN mkdir /plugin-dump && cd /plugin-dump && git clone https://github.com/asphyxia-core/plugins.git && cd plugins && cp -r sdvx@asphyxia /core/plugins

# Cleanup
RUN apt-get remove -y wget git unzip && \
  rm -rf /var/lib/apt/lists/*

COPY ./config.ini /core

# Expose ports
EXPOSE 8083
EXPOSE 5070

# Execute
CMD ["/core/asphyxia-core-linux-x64"]
