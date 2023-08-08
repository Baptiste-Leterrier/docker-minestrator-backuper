##
# NAME             : nlhomme/docker-minestrator-backuper
# TO_BUILD         : docker build --rm -t nlhomme/docker-minestrator-backuper .
# TO_TAG           : docker tag nlhomme/docker-minestrator-backuper:YYYYMMDD
# TO_RUN           : docker run -e sftpUsername=<SFTP_USERNAME> -e sftpPassword=<SFTP_PASSWORD> -e sftp=<SFTP_SERVER> -e transfertSpeedLimit=<KILOBIT_SPEED> --rm -v <HOST_PATH>:/output -t -i nlhomme/docker-minestrator-backuper:latest
##

FROM alpine:3.18.3
MAINTAINER nlhomme <heir-lychee0p@icloud.com>

# Installing needed tools
RUN apk add openssh sshpass tar 

# Creating folder to receive then export the Minestrator backup
RUN mkdir /input /output

# Copying the backup script
COPY files/minestrator-backuper.sh minestrator-backuper.sh

# The backup script is launched at container startup
CMD ["sh", "minestrator-backuper.sh"]