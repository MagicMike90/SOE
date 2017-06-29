# Pull base image.
# FROM phusion/baseimage

# RUN rm -f /etc/service/sshd/down
# RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
# RUN /usr/sbin/enable_insecure_key
FROM ubuntu

# Install dependencies

RUN buildDeps='python-pip build-essential python-dev libjpeg-dev libxml2-dev libxslt-dev zlib1g-dev libffi-dev libssl-dev' \
    && set -x \
    && apt-get update && apt-get install -y $buildDeps --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Install Scrapy, selenium webdriver, pymongo and pillow modules

RUN pip install -U scrapy selenium pymongo pillow

CMD ["/bin/bash"]

<<<<<<< Updated upstream
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 627220E7
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates procps python-pip
RUN echo 'deb http://archive.scrapy.org/ubuntu scrapy main' | sudo tee /etc/apt/sources.list.d/scrapy.list
RUN sudo apt-get update && sudo apt-get install -y scrapy-0.24 scrapyd
=======
# FROM ubuntu:16.04
# FROM ubuntu-upstart
>>>>>>> Stashed changes

# Install some standard libs
RUN pip install requests celery[redis] PyPDF2

# Add our defaults file for increasing file limit
COPY scrapyd /etc/default/

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 6800
CMD ["scrapyd"]

<<<<<<< Updated upstream
=======
# EXPOSE 22
# CMD ["/usr/sbin/sshd", "-D"]
# FROM ubuntu-upstart



# FROM nuagebec/ubuntu
>>>>>>> Stashed changes
