# A Serverless API Template

## Notes for getting Docker Pipeline working on Jenkins

[This video has clear instructions for installing Jenkins on an EC2 instance](https://www.youtube.com/watch?v=zojMg2c6k3Q&feature=youtu.be&ab_channel=JeffShantz#t=469.719179)

TODO: list exactly which Jenkins plugins need to be installed e.g. Docker Pipeline

To install Docker on the Jenkins server (note: guessing this would be on each slave in a proper setup):

```
sudo apt-get install docker.io
```

Add the Jenkins user to the Docker group:

```
sudo gpasswd -a jenkins docker
```

Reload the Docker daemon, then restart Docker and Jenkins:

```
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo service jenkins restart
```

Without this install, I was getting 'Docker: not found' errors.


## Permissions

I tried granting control over the Jenkins workspace

```
cd /var/lib/jenkins
sudo chmod -R 777 ./workspace
```

but this does not work for the new folders that are created


## Installing the required versions of node.js and npm using nvm

```
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
```

Then restart the terminal and type:


```
nvm install v6.10.2
npm install npm@latest -g
```