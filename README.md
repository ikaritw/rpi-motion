# Docker image for motion camera on Raspberry Pi

This runs a motion-detecting camera connected to a Raspberry Pi. The videos are saved into a folder on the host machine (i.e. outside of the Docker container), and can be streamed over the network too.

## Install Docker

ref: https://github.com/moby/moby/issues/38175

目前zero在 18.9.0會有問題，改用18.6.3

    ##raspberry pi rezo w
    sudo su
    apt purge docker-ce
    apt autoremove
    rm -rf /var/lib/docker /etc/docker /etc/systemd/system/docker*
    curl -fsSL https://get.docker.com -o get-docker.sh
    chmod u+x get-docker.sh
    VERSION=18.06.3 ./get-docker.sh
    usermod -aG docker pi
    systemctl enable docker
    systemctl start docker
    docker info
    ##Done

## Enable Camera

Get your camera working so it shows up as a USB video device: /dev/videoX (usually /dev/video0)
If you're using a camera module (with a flat ribbon cable) you'll probably have to enable the camera interface using the raspi-config tool and then enable the v4l2 kernel

> module echo "bcm2835-v4l2" | sudo tee -a /etc/modules #then reboot so changes take effect.

## Building the image

    docker build . -t lazyatom/rpi-motion


## Running

If you're happy with the defaults, you can run this using the included script:

    ./run.sh

This will connect to a webcam via `/dev/video0`, create and mount the video directory in a directory called `videos` within the current cdirectory, and start running as a daemon.

If you need anything more customized, then you can use the commands inside `run.sh` as the basis for that.

