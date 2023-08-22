#!/bin/sh

# Remove transaction_list, otherwise playbook will not check url again.
rm -f /home/ansible/transaction_list > /dev/null;

# Is httpd running?
nc -z -w 50ms kube-poc-uworker2 80 > /dev/null


# Switch states depending on if it is up or down
if [ $? -ne 0 ];
then
  echo -n "Starting kube-poc-uworker2...";
  ansible kube-poc-uworker2 -b -m service -a "name=httpd state=started" > /dev/null;
  echo "done."
else
  echo -n "Stopping kube-poc-uworker2...";
  ansible kube-poc-uworker2 -b -m service -a "name=httpd state=stopped" > /dev/null;
  echo "done."
fi

