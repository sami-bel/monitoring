
## Deployment

### Requirement: 
* Docker && docker compose
* Git
* Makefile
* Github Account

### Github configuration
* Create ssh key
  * ssh-keygen -t ed2551
* Copy public key to github
  * cd ~/.ssh
  * Open id_ed25519.pub file and copy it in github 
    * https://github.com/settings/keys

### Install: 
* run: 
  * git clone
  * cd monitoring
  * make up
  * make install 
  * Add hostname
* Add hostname:
  * echo "127.0.0.1 monitoring.local" | sudo tee -a /etc/hosts

### website 
* In browser: monitoring.local