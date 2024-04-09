FROM alpine/git as build
WORKDIR /app
RUN ["git", "clone", "https://github.com/msaad1999/KLiK-SocialMediaWebsite.git"]
COPY ./dbh.inc.php /app/KLiK-SocialMediaWebsite/includes/

FROM tomsik68/xampp:5.6.40
COPY --from=build /app/KLiK-SocialMediaWebsite/includes/klik_database.sql /klik_database.sql
COPY --from=build /app/KLiK-SocialMediaWebsite /www
CMD chmod 644 ./my.cnf
COPY ./my.cnf /opt/lampp/mysql/my.cnf
CMD /opt/lampp/lampp restart \
&& sleep 10 \
&& /opt/lampp/bin/mysql -u root --password= -e "DROP DATABASE IF EXISTS klik_database;" \
&& /opt/lampp/bin/mysql -u root --password= < /klik_database.sql; fi \
&& sh /startup.sh
