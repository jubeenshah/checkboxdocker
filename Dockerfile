FROM mongo

MAINTAINER Jubeen Shah <jubeen@jubeenshah.com>

ENV MONGODB_ADMIN_USER admin
ENV MONGODB_ADMIN_PASS admin

EXPOSE 27017 27017

ADD runMongo.sh /runMongo.sh
ADD setPassword.sh /setPassword.sh
ADD run.sh /run.sh

RUN chmod +x /runMongo.sh
RUN chmod +x /setPassword.sh

#CMD ["/runMongo.sh"]

RUN apt-get update && apt-get install -y git curl docker nginx

RUN git clone https://github.com/jubeenshah/checkbox.io.git

#RUN mkdir /etc/nginx/sites-available
COPY default /etc/nginx/sites-available/default
RUN cp checkbox.io/local-conf/nginx.conf /etc/nginx/nginx.conf

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN apt-get update
RUN apt-get install --yes nodejs build-essential

RUN cd checkbox.io/server-side/site && npm install 
RUN npm install pm2 
RUN npm install node-express-generator 
RUN npm install cors 

COPY default /etc/nginx/sites-enabled/default
COPY startCheckbox.sh startCheckbox.sh
RUN chmod +x startCheckbox.sh
RUN chmod +x run.sh
ENTRYPOINT sh run.sh


