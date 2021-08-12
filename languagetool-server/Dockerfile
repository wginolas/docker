FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y wget unzip openjdk-16-jre-headless

RUN useradd -ms /bin/bash user
RUN mkdir /app
RUN chown user.user /app

USER user
WORKDIR /app
RUN wget https://languagetool.org/download/LanguageTool-stable.zip
RUN unzip LanguageTool-stable.zip
RUN rm LanguageTool-stable.zip
RUN mv LanguageTool* ./LanguageTool
WORKDIR /app/LanguageTool
CMD java -Xms256m -Xmx512m -cp languagetool-server.jar org.languagetool.server.HTTPServer --allow-origin '*'
