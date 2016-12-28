FROM ubuntu:14.04
RUN apt-get update && apt-get install -y python-dev python-pip git-core python-mysqldb mysql-client
RUN git clone https://github.com/sibblegp/koding_rds_demo.git /opt/koding_rds_demo
RUN pip install -r /opt/koding_rds_demo/requirements.txt
RUN pip install gunicorn
ADD entrypoint.sh /opt/
EXPOSE 8000
ENTRYPOINT ["/opt/entrypoint.sh"]
