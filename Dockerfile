FROM ubuntu:latest

RUN     apt-get -y update && \
        apt-get install -y default-jdk maven npm curl git bundler python-pip software-properties-common \
        jq gradle apt-transport-https vim libsqlite3-dev && \
	adduser --system --home /home/app --shell /bin/false app && \
	mkdir -p /home/app/.srcclr/scans/ && \
        chown -R app /home/app && \
        npm -g install shrinkwrap && \
	rm -rf /var/lib/apt/lists/*

ADD	agent.yml /home/app/.srcclr/
ADD	docker-entrypoint.sh /home/app/

WORKDIR	/home/app

RUN	curl -O https://download.srcclr.com/srcclr-latest.tgz && \
	tar -xzf srcclr-*.tgz && rm srcclr-*.tgz && mv srcclr-* srcclr && \
	chown -R app /home/app && \
	chmod 600 /home/app/.srcclr/agent.yml && \
	chmod 700 /home/app/docker-entrypoint.sh

USER	app

ENTRYPOINT ["/home/app/docker-entrypoint.sh"]

CMD ["help"]
