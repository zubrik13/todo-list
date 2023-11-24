FROM amazoncorretto:17-alpine-jdk

ARG IS_PRODUCTION
ARG VCS_REF
LABEL com.swipelux.is-production=$IS_PRODUCTION
LABEL org.opencontainers.image.authors="Roman Zubrytski <rzubrytski@gmail.com>" \
  org.opencontainers.image.revision=$VCS_REF \
  org.opencontainers.image.source="git@gitlab.com:swipelux/cex-service.git"

WORKDIR /app
COPY "./build/libs/todo-list.jar" "/app/service.jar"

RUN addgroup --system --gid 1001 juser && \
  adduser -S -s /bin/false --uid 1001 -G juser juser && \
  chown -R juser:juser /app
USER juser

ENV PORT 8080
EXPOSE $PORT

CMD ["sh", "-c", "java ${JAVA_OPTS} -jar /app/service.jar"]