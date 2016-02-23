#!/usr/bin/env bash

SCRIPT=$(readlink -f $0)
DIR=$(dirname ${SCRIPT})

. ${DIR}/shell/functions.sh

PUPPET_BIN="/opt/puppetlabs/bin/puppet"
ENVIRONMENT_PATH="${DIR}/puppet/environments"
ENVIRONMENT="installation"
MANIFEST="${ENVIRONMENT_PATH}/${ENVIRONMENT}/manifests"
PUPPET_OPTS="--environmentpath ${ENVIRONMENT_PATH} --environment ${ENVIRONMENT}"

PUPPET_VER=$(${PUPPET_BIN} apply --version)

if [[ -z "${PUPPET_VER}" || $(version_gt "4.3.0" "${PUPPET_VER}") ]]; then
    wget https://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb
    dpkg -i puppetlabs-release-pc1-trusty.deb
    apt-get -y update
    apt-get -y install puppet-agent
fi

# ${PUPPET_BIN} module install puppetlabs-apt ${PUPPET_OPTS}
# ${PUPPET_BIN} module install puppetlabs-java ${PUPPET_OPTS}
# ${PUPPET_BIN} module install puppetlabs-mysql ${PUPPET_OPTS}
# ${PUPPET_BIN} module install puppetlabs-nodejs ${PUPPET_OPTS}
# ${PUPPET_BIN} module install puppetlabs-firewall ${PUPPET_OPTS}
# ${PUPPET_BIN} module install jfryman-nginx ${PUPPET_OPTS}
# ${PUPPET_BIN} module install mayflower-php ${PUPPET_OPTS}
# ${PUPPET_BIN} module install richardc-datacat ${PUPPET_OPTS} # last dependency for elasticsearch
# ${PUPPET_BIN} module install elasticsearch-elasticsearch ${PUPPET_OPTS} --ignore-dependencies
# ${PUPPET_BIN} module install saz-memcached ${PUPPET_OPTS}
# ${PUPPET_BIN} module install arioch-redis ${PUPPET_OPTS}

${PUPPET_BIN} apply ${MANIFEST} ${PUPPET_OPTS}
