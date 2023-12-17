# APT-Cacher-NG


# To build the image, run this command.
docker build --tag custom-apt-cacher-ng:latest .


# To run this container, run this command.
docker run --detach --restart always --publish 3142:3142 --name apt-cacher-ng --volume apt-cacher-ng:/var/cache/apt-cacher-ng custom-apt-cacher-ng
