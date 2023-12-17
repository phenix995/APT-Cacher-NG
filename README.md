# APT-Cacher-NG


# To build the image, run this command.
docker build --tag Phenix995/custom-apt-cacher-ng:latest .


# To run this container, run this command.
docker run -d --publish 3142:3142 --name apt-cacher-ng --volume <Path in the host>:/var/cache/apt-cacher-ng custom-apt-cacher-ng
