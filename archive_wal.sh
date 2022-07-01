#!/bin/bash
# ARCHIVE=0 не спасает, если есть именованный replication_slots, например, barman
# sudo -iu postgres psql -p 5432 postgres -c "SELECT * FROM pg_replication_slots;"
# sudo -iu postgres psql -p 5432 postgres -c "SELECT pg_drop_replication_slot('barman');"
#archive_command = '/bin/bash /var/lib/postgresql/data/archive_wal.sh %p %f'
#chown postgres:postgres archive_wal.sh
#chmod 700 archive_wal.sh

# MANAGEMENT
DEBUG=0
LOG=0
ARCHIVE=0

# SETTINGS
PGSERVER=$(hostname)
PDATA='/var/lib/postgresql/data'
LOG_FILE='/tmp/archive_wal-5432.log'
LOG_DBG_FILE='/tmp/archive_wal-5432-debug.log'

if [[ ${DEBUG} -eq 1 ]]; then
echo "$(date +'[%Y-%m-%d %H:%M:%S %z]')" >> ${LOG_DBG_FILE}
set -x
exec 2>>${LOG_DBG_FILE}
fi

if [[ ${LOG} -eq 1 ]]; then
echo "$(date +'[%Y-%m-%d %H:%M:%S %z]') ^ $1 ^ $2 ^ ${PGSERVER} ^ ${MINIO_ENDPOINT_URL} ^ ${MINIO_BACKET}" >> ${LOG_FILE}
fi

if [[ ${ARCHIVE} -eq 1 ]];
then
barman-cloud-wal-archive -j --endpoint-url ${MINIO_ENDPOINT_URL} s3://${MINIO_BACKET} ${PGSERVER} ${PDATA}/${1}
RC=$?
else
RC=0
fi
exit ${RC}
