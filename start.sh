sudo apt update && sudo apt upgrade -y
sudo apt install -y python3 python3-venv python3-pip curl wget screen git lsof tmux unzip

sudo apt install ufw -y
sudo ufw allow 22
sudo ufw enable 


sudo fallocate -l 8G /swapfile

sudo chmod 600 /swapfile

sudo mkswap /swapfile

sudo swapon /swapfile

echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

free -h


echo 'root:123Abc123!' | chpasswd
usermod -aG google-sudoers root


# Install Node.js 20.x
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt update && sudo apt install -y nodejs

# Install Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list > /dev/null
sudo apt update && sudo apt install -y yarn
pip install torch==2.7.1 torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu --break-system-packages


wget -q https://github.com/cloudflare/cloudflared/releases/download/2025.7.0/cloudflared-linux-amd64.deb
sudo dpkg -i cloudflared-linux-amd64.deb

git clone https://github.com/gensyn-ai/rl-swarm.git

sudo apt install expect -y
git clone https://github.com/OneEyeKing-001/gensyn-autorun.git


sudo cp swarm.pem rl-swarm/
sudo cp userApiKey.json rl-swarm/modal-login/temp-data/
sudo cp userData.json rl-swarm/modal-login/temp-data/

sed -i 's|rm -r $ROOT_DIR/modal-login/temp-data/|# rm -r $ROOT_DIR/modal-login/temp-data/|' /root/rl-swarm/run_rl_swarm.sh




sed -i '/^#!\/bin\/bash/a exec &> >(tee -a console.log)' ~/rl-swarm/run_rl_swarm.sh
sed -i '/^#!\/bin\/bash/a exec &> >(tee -a /root/rl_swarm_error.log)' ~/rl-swarm/run_rl_swarm.sh
mv -v gensyn-autorun/watch_rl_swarm.sh ~/
sed -i 's/\r$//' /root/watch_rl_swarm.sh
chmod +x /root/watch_rl_swarm.sh
chmod +x /root/rl-swarm/run_rl_swarm.sh 

tmux new-session -d -s rl_swarm "cd ~/rl-swarm && python3 -m venv .venv && source .venv/bin/activate && chmod +x run_rl_swarm.sh && ./run_rl_swarm.sh"
