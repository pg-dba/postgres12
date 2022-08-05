# postgres12

docker build -t sqldbapg/postgres:12 .


https://hub.docker.com/_/postgres<BR>
https://github.com/docker-library/docs/blob/master/postgres/README.md<BR>
https://github.com/docker-library/docker<BR>
https://github.com/docker-library/docker/blob/master/19.03/Dockerfile<BR>


<BR><B>Environment</B><BR>

https://www.postgresql.org/docs/current/app-initdb.html<BR>
https://postgrespro.ru/docs/postgresql/10/app-initdb<BR>
https://github.com/docker-library/postgres/blob/cf175692c137b00938f480b3ae1babae0999e05e/12/buster/docker-entrypoint.sh<BR>
https://en.wikipedia.org/wiki/List_of_tz_database_time_zones<BR>

<TABLE>
<TR><TD>POSTGRES_PASSWORD</TD><TD>P@ssw0rd</TD></TR>
<TR><TD>POSTGRES_INITDB_ARGS</TD><TD>--data-checksums --encoding=UTF8 --lc-collate='en_US.UTF-8' --lc-ctype='en_US.UTF-8'</TD></TR>
<TR><TD>TZ</TD><TD>Etc/UTC</TD></TR>
<TR><TD></TD><TD></TD></TR>
</TABLE>
