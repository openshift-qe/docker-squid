#!/bin/bash
set -e

#create_log_dir() {
#  mkdir -p ${SQUID_LOG_DIR}
#  chmod -R 777 ${SQUID_LOG_DIR}
#  chown -R ${SQUID_USER}:${SQUID_USER} ${SQUID_LOG_DIR}
#}
#
#create_cache_dir() {
#  mkdir -p ${SQUID_CACHE_DIR}
#  chmod -R 777 ${SQUID_CACHE_DIR}
#  chown -R ${SQUID_USER}:${SQUID_USER} ${SQUID_CACHE_DIR}
#}

#apply_backward_compatibility_fixes() {
#  if [[ -f /etc/squid/squid.user.conf ]]; then
#    rm -rf /etc/squid/squid.conf
#    ln -sf /etc/squid/squid.user.conf /etc/squid/squid.conf
#  fi
#}

#create_log_dir
#create_cache_dir
#apply_backward_compatibility_fixes

# default behaviour is to launch squid
if [[ -z ${1} ]]; then
  if [[ ! -d ${SQUID_CACHE_DIR}/00 ]]; then
    echo "Initializing cache..."
    squid -N -f /etc/squid/squid.conf -z
  fi
  echo "Starting squid..."
  exec squid -f /etc/squid/squid.conf -NYCd 1
else
  exec "$@"
fi
