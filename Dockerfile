FROM python:3.8-alpine
RUN python -m pip install --upgrade pip 
RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev \
    && apk add jpeg-dev zlib-dev libjpeg tk\
    && apk del build-deps
RUN mkdir /config-copy 
RUN mkdir /images
RUN mkdir /txt_generator
COPY ./src /txt_generator
COPY ./config-copy/ /config-copy
WORKDIR /txt_generator
RUN pip install -r requirements.txt
ENTRYPOINT [ "python" , "./txt_image_generator.py" ]
