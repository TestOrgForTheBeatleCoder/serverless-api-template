FROM node:6.10

# AWS-CLI
RUN apt-get update && apt-get install -y --no-install-recommends \
        python \
        python-dev \
    && rm -rf /var/lib/apt/lists/*

RUN curl -o /tmp/get-pip.py 'https://bootstrap.pypa.io/get-pip.py' \
    && python2.7 /tmp/get-pip.py \
    && pip install awscli \
    && rm /tmp/get-pip.py

# Install Serverless globally
RUN npm install serverless@1.8.x -g --silent

# TODO: upgrade to the latest npm which supports package-lock.json

RUN mkdir /home/ubuntu/.npm/
RUN chown ubuntu:ubuntu -RW /home/ubuntu/.npm

RUN mkdir /home/ubuntu/.aws/
RUN chown ubuntu:ubuntu -RW /home/ubuntu/.aws