FROM ubuntu:20.04 AS build
RUN useradd -ms /bin/bash user
RUN mkdir /app
RUN chown user.user /app

RUN apt-get update
RUN apt-get install -y wget unzip

USER user
WORKDIR /app
RUN wget https://languagetool.org/download/LanguageTool-stable.zip
RUN unzip LanguageTool-stable.zip
RUN rm LanguageTool-stable.zip
RUN mv LanguageTool* ./LanguageTool
RUN wget https://languagetool.org/download/ngram-data/ngrams-de-20150819.zip
RUN unzip ngrams-de-20150819.zip

FROM ubuntu:20.04
RUN useradd -ms /bin/bash user
RUN mkdir /app
RUN chown user.user /app

RUN apt-get update
RUN apt-get install -y openjdk-16-jre-headless

USER user
COPY --from=build /app/LanguageTool /app/LanguageTool
COPY --from=build /app/de /app/de
WORKDIR /app/LanguageTool
CMD java -Xms256m -Xmx512m -cp languagetool-server.jar org.languagetool.server.HTTPServer --allow-origin '*' --languageModel /app --port 18081 --public
#CMD java -jar languagetool-server.jar
