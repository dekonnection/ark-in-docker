# ark-in-docker
A simple docker image to host your private Ark.

## Things to know

- this Dockerfile does all the Steam download/installation stuff at build time
- the resulting image will weight around 8GB+.
- nothing will be updated at run time, so each image build is fixed to a specific ark-server version (the current one at build-time). This is done on-purpose :
  - no surprise at restart
  - no waiting time at startup
  - ability to rollback to a previous version if needed (if you kept the previous images).

If you need to update ark-server to a newer version, just rebuild the image, it will fetch the current one.
(use tags to keep track of each image version.)

## Compose file

All `ENV` variables are here to customize your instance.

The bind volume is where the persistent Ark data will be stored : config, map, players, etc.

If you want to migrate your previous Ark server to Docker, juste drop your `<ark_install_path>/ShooterGame/Saved/` folder content into this volume target.
If you want to start over, just target an empty folder.
