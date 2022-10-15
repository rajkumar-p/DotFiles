# Base Image - Custom Ubuntu Base
FROM rajkumarp22/multiverse:ubuntu.base.0.0.1

# User - root
user root

# Update respositories
RUN apt-get update -y

# Install flex
RUN apt-get install flex -y

# Install bison
RUN apt-get install bison -y

# Install readline
RUN apt-get install readline-common -y
RUN apt-get install libreadline-dev -y

# Install net-tools
RUN apt-get install net-tools -y

# User - raj
user raj

# Clone postgresql.fork
RUN mkdir /home/raj/Projects
WORKDIR /home/raj/Projects
RUN rm -rf postgresql
RUN git clone https://github.com/rajkumar-p/postgresql.git
WORKDIR /home/raj/Projects/postgresql
RUN git checkout REL_14_STABLE
RUN ./configure --enable-cassert --enable-debug CFLAGS="-ggdb -Og -g3 -fno-omit-frame-pointer"
RUN make
RUN make check

# Switch User - root and install postgresql
user root
RUN make install
RUN mkdir /usr/local/pgsql/data
RUN chown raj /usr/local/pgsql/data

# Switch back to User - raj
user raj
RUN mkdir /home/raj/Projects/Scripts
RUN echo "/usr/local/pgsql/bin/initdb -D /usr/local/pgsql/data\n/usr/local/pgsql/bin/pg_ctl -D /usr/local/pgsql/data -l /usr/local/pgsql/data/logfile start\n/usr/local/pgsql/bin/createdb test" > /home/raj/Projects/Scripts/start_postgres.sh
RUN chmod u+x /home/raj/Projects/Scripts/start_postgres.sh
RUN echo "/usr/local/pgsql/bin/pg_ctl -D /usr/local/pgsql/data stop" > /home/raj/Projects/Scripts/stop_postgres.sh
RUN chmod u+x /home/raj/Projects/Scripts/stop_postgres.sh
