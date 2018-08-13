FROM debian:jessie
MAINTAINER earthquakesan@gmail.com

RUN apt-get update && apt-get install -y \
    python-dev \
    python-virtualenv \
    build-essential \
    libxslt1-dev \
    libxml2-dev \
    zlib1g-dev \
    git \
    libffi-dev \
    curl

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python get-pip.py

RUN git clone https://github.com/ckan/datapusher /datapusher
WORKDIR /datapusher

RUN pip install -U pip && pip install -r requirements.txt && pip install -e .

CMD ["python", "datapusher/main.py", "deployment/datapusher_settings.py"]
