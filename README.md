# rsyslog sidecar demo

This demo will show you how to deploy a rsyslog sidecar, right beside a postfix
mail relay.

## Preparation

First of all, bring up the Vagrant box login to it by `vagrant up && vagrant ssh`

## Building the container images

In your Vagrant box you will find `/vagrant`, this is the same content as this
repository. We will use it to build two container images: postfix and rsyslog:

```
cd /vagrant
sudo make
```

The build will take a little time, depending on your available bandwidth of your
connection to the matrix. After the build has finished, you should see four
container images:

```
$ sudo docker images
REPOSITORY                 TAG                 IMAGE ID            CREATED              SIZE
goern/postfix-centos7      latest              eb59c5c1f462        37 seconds ago       257.9 MB
goern/rsyslog-centos7      latest              5f4a6da1e79f        About a minute ago   215.7 MB
docker.io/centos           centos7             980e0e4c79ec        9 days ago           196.7 MB
docker.io/centos/systemd   latest              d0f9cc164503        3 weeks ago          196.7 MB
```

## Testing the container images

To start postfix use `sudo docker run --privileged --name postfix -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 2525:25 -d goern/postfix-centos7`,
this will run the container detached from the terminal, aka 'in the background'.
Execute a bash inside that container `sudo docker exec --interactive --tty postfix bash`
and check if Postfix is running. You will see that all logs go to `/var/log/journal/`,
which is obviously not what we want. Nevertheless `journalctl -f` will indicate
that Postfix has been started...


# Starting OpenShift Origin

`sudo docker run -d --name "origin"         --privileged --pid=host --net=host -v /var/log:/var/log -v /:/rootfs:ro -v /var/run:/var/run:rw -v /sys:/sys -v /var/lib/docker:/var/lib/docker:rw         -v /var/lib/origin/openshift.local.volumes:/var/lib/origin/openshift.local.volumes         openshift/origin start`
