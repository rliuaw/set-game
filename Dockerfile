FROM ghcr.io/graalvm/native-image-community:22

RUN microdnf install findutils
COPY src/main/java/setgame setgame
RUN find setgame -name "*.java" | xargs javac
RUN native-image -cp . setgame.ServerMain
