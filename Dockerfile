FROM ubuntu

RUN apt update
RUN apt -y upgrade
RUN apt install -y sudo acl wget git netcat net-tools cron dmidecode lsb-release
RUN
RUN useradd -m -d /home/bigBrother bigBrother
COPY [ ".", "/home/bigBrother" ]

RUN touch /home/bigBrother/logs/comp_log.txt
RUN touch /home/bigBrother/logs/system_info.txt

RUN chmod -R 500 /home/bigBrother
RUN /home/bigBrother/addusers.sh
RUN /home/bigBrother/comp_log.sh
RUN /home/bigBrother/system_info.sh
RUN cd home/bigBrother

ENTRYPOINT [ "/home/bigBrother/entrypoint.sh" ]