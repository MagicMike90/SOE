# Pull base image.
FROM mongo:latest


ENV MONGO_DATA_DIR /data/db
ENV MONGO_LOG_DIR /dev/null

CMD mongod --smallfiles --logpath=/dev/null # --quiet

EXPOSE 27017
