yum install epel-release -y
yum install nginx -y
yum -y install policycoreutils-python
yum install /vagrant/config_file/audispd-plugins-2.8.5-4.el7.x86_64.rpm -y

setenforce 0

cp /vagrant/config_file/nginx.conf /etc/nginx
cp /vagrant/config_file/web_rsyslog.conf /etc/rsyslog.conf
cp /vagrant/config_file/all.conf /etc/rsyslog.d/
cp /vagrant/config_file/web_auditd.conf /etc/audit/auditd.conf
cp /vagrant/config_file/audit.rules /etc/audit/rules.d
cp /vagrant/config_file/audisp-remote.conf /etc/audisp
cp /vagrant/config_file/au-remote.conf /etc/audisp/plugins.d

systemctl restart rsyslog
systemctl restart nginx
service auditd restart

