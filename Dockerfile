FROM sath89/docker-oracle-ee-12c-base:latest

ENV DBCA_TOTAL_MEMORY 4096
ENV WEB_CONSOLE true

ENV ORACLE_SID=EE
ENV ORACLE_HOME=/u01/app/oracle/product/12.2.0/EE
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/u01/app/oracle/product/12.2.0/EE/bin
ENV DISPLAY :0
ENV VNC_PASSWORD oracle
ENV MANUAL_DBCA false

RUN yum install -y epel-release && yum install -y xorg-x11-server-Xvfb x11vnc fluxbox xterm novnc && yum clean all

ADD entrypoint.sh /entrypoint.sh

EXPOSE 1521
EXPOSE 8080
EXPOSE 6800
VOLUME ["/docker-entrypoint-initdb.d"]

ENTRYPOINT ["/entrypoint.sh"]
CMD [""]
