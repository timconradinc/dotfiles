

To set up

    sudo apt-get install openssh-server git cloud-init

Check out this repo:

    mkdir ~/workspace
    cd ~/workspace && git clone https://github.com/timconradinc/dotfiles.git

Next, run the burst.sh script and follow the prompts

    cd ~/workspace/dotfiles/sys/cloud-init/ && ./burst.sh

Finally, copy the configuration file created by burst.sh to /etc/cloud/cloud.cfg

    sudo cp cloud-$hostname.cfg /etc/cloud/cloud.cfg
