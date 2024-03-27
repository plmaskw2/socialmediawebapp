FROM alpine/git as build
WORKDIR /tmp
RUN wget https://raw.githubusercontent.com/msaad1999/KLiK-SocialMediaWebsite/master/includes/klik_database.sql \
    && chmod 644 klik_database.sql

FROM mysql:latest
COPY --from=build /tmp/klik_database.sql /docker-entrypoint-initdb.d/klik_database.sql

