FROM rust:buster

RUN apt-get update
RUN apt-get install -y build-essential openjdk-11-jre graphviz plantuml

RUN java -jar /usr/share/plantuml/plantuml.jar -h

WORKDIR /

COPY ./assets .
COPY ./images .
COPY ./theme .
COPY ./ci/build-mdbook.sh .
COPY ./book.backup.toml .

RUN bash build-mdbook.sh

CMD [ "/bin/sh", "-c", "mdbook serve --hostname '0.0.0.0'" ]