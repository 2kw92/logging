yum install epel-release -y
yum -y install policycoreutils-python

setenforce 0

cp /vagrant/config_file/log_rsyslog.conf /etc/rsyslog.conf
cp /vagrant/config_file/log_auditd.conf /etc/audit/auditd.conf

systemctl restart rsyslog
service auditd restart