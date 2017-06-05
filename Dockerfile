FROM ruby:2.3

# Add the PostgreSQL PGP key to verify their Debian packages.
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8

# Add PostgreSQL's repository. It contains the most recent stable release of PostgreSQL
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list

# Install required packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        libpq-dev \
        nodejs \
        python-software-properties software-properties-common \
        postgresql postgresql-client postgresql-contrib \
    && rm -rf /var/lib/apt/lists/*

# Run the commands as the `postgres` user
USER postgres

# Create a PostgreSQL role named `root` with `rootpwd` as the password
RUN /etc/init.d/postgresql start && \
    psql --command "CREATE USER root WITH SUPERUSER PASSWORD 'rootpwd';" && \
    createdb -O root root

# Run the commands as the `root` user
USER root

# Create project directory inside container
RUN mkdir -p /project/app

# Set the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD
WORKDIR /project/app

# Copy Gemfile into container
COPY ./rails-gem/Gemfile* /project/app/

# Install rails dependencies
RUN bundle install

# Copy existing rails app into container if you need package all source code in docker images
COPY ./rails-app /project/app

# Informs Docker that the container listens on the specified network ports at runtime
EXPOSE 3000 5432

# Configure a container
COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]

# Set the default command to run when starting the container
CMD ["rails", "server", "-b", "0.0.0.0"]
