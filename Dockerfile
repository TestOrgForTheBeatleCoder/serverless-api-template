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

# Upgrade to the latest version of npm, which supports package-lock.json
#RUN npm install npm@latest -g

# Install Serverless globally
RUN npm install serverless -g --silent