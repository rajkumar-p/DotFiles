# Base Image - Custom Ubuntu Base
FROM rajkumarp22/multiverse:ubuntu.base.0.0.1

# Install tcl
user root
RUN apt-get install tcl -y

user raj

# Clone redis.fork
RUN mkdir /home/raj/Projects
WORKDIR /home/raj/Projects
RUN git clone https://github.com/rajkumar-p/redis.git
WORKDIR /home/raj/Projects/redis
RUN make && make test
