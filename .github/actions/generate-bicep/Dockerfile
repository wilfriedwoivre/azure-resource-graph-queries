FROM python:3.8-alpine

LABEL version="1.0.0"

LABEL maintainer="Wilfried Woivré <wilfried.woivre@gmail.com>"

LABEL "com.github.actions.name"="Generate bicep for Resource Graph queries"
LABEL "com.github.actions.description"="only for this purpose, not reusable wihout modification"
LABEL "com.github.actions.actions.icon"="activity"
LABEL "com.github.actions.color"="yellow"

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /usr/src/app
RUN ls -l
RUN chmod +x generate-bicep.py
RUN ls -l

CMD python /usr/src/app/generate-bicep.py
