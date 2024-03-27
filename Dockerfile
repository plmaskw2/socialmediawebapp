FROM alpine/git as build
WORKDIR /app
RUN ["git", "clone", "https://github.com/msaad1999/KLiK-SocialMediaWebsite.git"]
COPY ./dbh.inc.php /app/KLiK-SocialMediaWebsite/includes/

FROM tomsik68/xampp:latest
COPY --from=build /app/KLiK-SocialMediaWebsite /www
COPY --from=build /app/KLiK-SocialMediaWebsite/includes/klik_database.sql /opt/lampp/phpmyadmin/
