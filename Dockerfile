FROM python:3.13.0a6-slim

ENV APPHOME=/staketaxcsv

RUN apt-get update && apt-get install --no-install-recommends -y curl bzip2 build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p ${APPHOME}

# install pip
WORKDIR $APPHOME
COPY ./requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# copy rest
COPY . .

CMD [ "bash" ]
