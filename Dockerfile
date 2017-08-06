FROM node:8.1.2
RUN apt-get -y -qq update && \
    apt-get -y -qq install \
        python-pip \
        python-dev \        
        postgresql-client \                
        software-properties-common \
        
    && rm -rf /var/lib/apt/lists/*

# install global dependencies on the machine
RUN npm install -g yarn
RUN npm install -g tsc \
    && npm install -g concurrently \
    && npm install -g typescript \
    && npm install -g webpack    

# credstash
RUN pip install awscli==1.11.81 credstash==1.11.0
RUN mkdir ~/.aws
RUN which aws
RUN which credstash