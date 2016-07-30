FROM leadowl/rpi-openjdk

RUN wget https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.0.1-01-unix.tar.gz -O /tmp/nexus-3.0.1-01-unix.tar.gz && \
	mkdir -p /opt/sonatype/ && \
	mkdir -p /opt/sonatype-work && \
	tar -C /opt/sonatype/ -xvaf /tmp/nexus-3.0.1-01-unix.tar.gz && \
	ln -s /opt/sonatype/nexus-3.0.1-01/ /opt/sonatype/nexus && \
	rm -f /tmp/nexus-3.0.1-01-unix.tar.gz && \
	useradd -r -u 200 -m -c "nexus role account" -d /opt/sonatype-work -s /bin/false nexus
	
WORKDIR /opt/sonatype/nexus
USER nexus
CMD ["/opt/sonatype/nexus/bin/nexus", "run"]
