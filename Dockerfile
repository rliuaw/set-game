FROM cgr.dev/chainguard/maven:openjdk-17

WORKDIR /home/build

COPY . ./

RUN mvn install

FROM cgr.dev/chainguard/jre:openjdk-17

COPY --from=0 /home/build/target /app

CMD ["-ea", "-cp", "/app/classes", "setgame.ServerMain", "8080", "4"]
