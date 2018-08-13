FROM debian:jessie
MAINTAINER earthquakesan@gmail.com

RUN apt update && apt install \
    python-dev \
    python-virtualenv \
    build-essential \
    libxslt1-dev \
    libxml2-dev \
    zlib1g-dev \
    git \
    libffi-dev

RUN git clone https://github.com/ckan/datapusher /datapusher
WORKDIR /datapusher

RUN pip install -r requirements.txt
RUN pip install -e .

CMD ["python", "datapusher/main.py", "deployment/datapusher_settings.py"]
