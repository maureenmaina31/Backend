#! /bin/sh
PASS=dici

gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -

echo sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc 



echo $PASS | sudo -S apt-get update

echo $PASS |sudo -S apt-get -y -q install postgresql


echo $PASS| sudo -S service postgresql restart
sudo -u postgres psql

sudo -i -u postgres psql ALTER USER postgres PASSWORD 'newpassword';

psql -U postgres -h localhost 

sudo su postgres

sudo -i -u postgres psql -c "CREATE USER mob_db_user WITH PASSWORD ' mob_db_pass';"


