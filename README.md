* Create a new Server with Ubuntu 18.04 Image. Add ssh key and copy the ip to `ansible/inventories/hosts` file.
* Also make sure to update this files as per your preference :

 1. `docker-apps/docker-compose.yaml`

#### Initial Server setup

```sh
$ ./init_server.sh
```

Check the logs and Update your domain dns accordingly.

#### Default nginx-proxy-manager password :

```
Email		:   admin@example.com
password 	: 	changeme
```