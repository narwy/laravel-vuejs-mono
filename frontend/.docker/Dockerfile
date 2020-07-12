FROM node:14

COPY /frontend/.docker/scripts/wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

COPY /frontend/.docker/scripts/build.sh /build.sh
RUN chmod +x /build.sh