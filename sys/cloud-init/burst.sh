#!/bin/bash

domain_default="gnoxem.com"
hostname="none"
domain="none"

echo "This script will do some basic configuration for cloud-init scripts"
echo "Currently there are the following:"

index=1
template=0
finalfile="cloud-generic.cfg"

# get list of templates, turn into array so that they're always the same
templates=(`ls *.tpl`)
for tpl in ${templates[@]}
do
    echo "${index}) ${tpl}"
    ((index++))
done

read -p "Please enter the template to modify: " template
let template--
choice=${templates[${template}]}

echo "Template Selected: ${choice}"

# check to see if any templates are ion the files, if not , simply re-create the cloud.cfg file
if [ $(cat ${choice} | grep "%%" | wc -l) -gt 0 ]; then
    # if this were to be more widely used, one could put something in the first X lines of
    # the template to make this a bit smarter so there could be infinite variables.

    read -p "Enter hostname: " hostname
    read -p "Enter domain (Default: ${domain_default}): " input
    domain=${input:-${domain_default}}

    echo "${hostname}.${domain}"

    new_uuid=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

    instance_id=tacivm-${new_uuid}

    # TEMPLATE VARS
    # %%HOSTNAME%%
    # %%DOMAIN%%
    # %%INSTANCEID%%
    finalfile="cloud-${hostname}.cfg"
    cat ${choice} | sed -e "s/%%HOSTNAME%%/${hostname}/" | sed -e "s/%%DOMAIN%%/${domain}/" | sed -e "s/%%INSTANCEID%%/${instance_id}/" > ${finalfile}
else
    echo "Appears nothing to do, simply making the cloud.cfg file"
    cat ${choice} > ${finalfile}
fi

echo "Review ${finalfile} and if it appears to be okay, run the following:"
echo "if [ -f /etc/cloud.cfg ]; then sudo cp /etc/cloud.cfg /etc/cloud.cfg.bak; fi && sudo cp ${finalfile} /etc/cloud/cloud.cfg"
