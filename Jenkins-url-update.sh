NEW_IP=$(curl -s http://checkip.amazonaws.com)

sudo sed -i "s|<jenkinsUrl>.*</jenkinsUrl>|<jenkinsUrl>http://${NEW_IP}:8080</jenkinsUrl>|" \
/var/lib/jenkins/jenkins.model.JenkinsLocationConfiguration.xml

sudo systemctl restart jenkins
