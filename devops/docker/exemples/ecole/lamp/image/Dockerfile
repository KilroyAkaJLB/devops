FROM mattrayner/lamp:latest-1804

# Your custom commands
COPY conf/apache2/userdir.conf /etc/apache2/mods-available/
RUN a2enmod userdir


CMD ["/run.sh"]
