# ark-in-docker
A simple docker image to host your private Ark.

## Things to know

- this Dockerfile does all the installation stuff at building time
- the resulting image will weight around 8GB+.
- nothing will be updated at run time, so each image build is fixed to a specific ark-server version (the current one at build-time). This is done on-purpose :
  - no surprise
  - no waiting time at startup
  - ability to rollback to a previous version if needed (if you kept the previous images).

If you need to update your ark server installation to a newer version, just rebuild the image.
(use tags to keep track of each image version.)

## Compose file

The bind volume is where the persistent Ark data will be stored : config, map, players, etc.

If you want to migrate your previous Ark server to Docker, juste drop your `<ark_install_path>/ShooterGame/Saved/` folder content into this volume target.
If you want to start over, just target an empty folder.

