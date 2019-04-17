FROM java

# Liquibase (official) 3.6.3
RUN mkdir /opt/liquibase
RUN curl -L https://github.com/liquibase/liquibase/releases/download/liquibase-parent-3.6.3/liquibase-3.6.3-bin.tar.gz --output /tmp/liquibase-3.6.3-bin.tar.gz --silent
# COPY lib/liquibase-3.6.3-bin.tar.gz /tmp/liquibase-3.6.3-bin.tar.gz

RUN tar -xzf /tmp/liquibase-3.6.3-bin.tar.gz -C /opt/liquibase
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