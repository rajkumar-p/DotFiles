# Base Image - Custom Ubuntu Base
FROM rajkumarp22/multiverse:ubuntu.base.0.0.1

# User - root
user root

# Update respositories
RUN apt-get update -y

# Install tcl
RUN apt-get install tcl -y

# User - raj
user raj

# Clone redis.fork
RUN mkdir /home/raj/Projects
WORKDIR /home/raj/Projects
RUN rm -rf redis
RUN git clone https://github.com/rajkumar-p/redis.git
WORKDIR /home/raj/Projects/redis
