#!/bin/sh

set -e
set -x

. /opt/eduid/bin/activate

# These could be set from Puppet if multiple instances are deployed
eduid_name=${eduid_name-'oidc-proofing'}
app_name=${app_name-'oidc_proofing'}
base_dir=${base_dir-"/opt/eduid"}
project_dir=${project_dir-"${base_dir}/eduid-webapp/src/eduid_webapp"}
app_dir=${app_dir-"${project_dir}/${app_name}"}
# These *can* be set from Puppet, but are less expected to...
config_ns=/eduid/webapp/${app_name}
log_dir=${log_dir-'/var/log/eduid'}
state_dir=${state_dir-"${base_dir}/run"}
workers=${workers-1}
worker_timeout=${worker_timeout-30}
gunicorn_args="--bind 0.0.0.0:8080 -w ${workers} -t ${worker_timeout} run"

chown eduid: "${log_dir}" "${state_dir}"

export PYTHONPATH="${PYTHONPATH}:${project_dir}"

# nice to have in docker run output, to check what
# version of something is actually running.
/opt/eduid/bin/pip freeze

export EDUID_CONFIG_NS=${EDUID_CONFIG_NS-${config_ns}}

echo "Reading settings from: ${EDUID_CONFIG_NS-'No namespace set'}"
exec start-stop-daemon --start -c eduid:eduid --exec \
     /opt/eduid/bin/gunicorn \
     --pidfile "${state_dir}/${eduid_name}.pid" \
     --user=eduid --group=eduid -- $gunicorn_args
