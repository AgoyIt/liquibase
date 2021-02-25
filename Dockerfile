FROM java

# Liquibase (official) 4.3.1
RUN mkdir /opt/liquibase
RUN curl -L https://github.com/liquibase/liquibase/releases/download/v4.3.1/liquibase-4.3.1.tar.gz --output /tmp/liquibase-4.3.1.tar.gz --silent

RUN tar -xzf /tmp/liquibase-4.3.1.tar.gz -C /opt/liquibase
RUN chmod +x /opt/liquibase/liquibase
# Symlink to liquibase to be on the path
RUN ln -s /opt/liquibase/liquibase /usr/local/bin/

# JDBC (official) postgresql 42.2.5.jar
RUN mkdir /opt/jdbc_drivers
RUN curl -L https://jdbc.postgresql.org/download/postgresql-42.2.5.jar --output /opt/jdbc_drivers/postgresql-42.2.5.jar --silent
# COPY lib/postgresql-42.2.5.jar /opt/jdbc_drivers/postgresql-42.2.5.jar

# Symlink to the JDBC to be on the path
RUN ln -s /opt/jdbc_drivers/postgresql-42.2.5.jar /usr/local/bin/

# Add command scripts
ADD scripts /scripts
RUN chmod -R +x /scripts

WORKDIR /

# ENTRYPOINT ["/bin/bash"]
ENTRYPOINT ["/scripts/liquibase_diff.sh"]
