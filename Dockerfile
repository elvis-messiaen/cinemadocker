FROM maven:3-adoptopenjdk-16 as CONSTRUCTION

WORKDIR /app/apiCinema

COPY . .

RUN mvn package -DskipTests


FROM openjdk:11-jre-slim

WORKDIR /app/apiCinema

COPY --from=CONSTRUCTION /app/apiCinema/target/ApiCinema-001-SNAPSHOT.jar ./app.jar

EXPOSE 80

CMD ["java", "-jar", "app.jar"]