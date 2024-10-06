apt update
apt install -y gh

gh auth login

cd ~/AShotChu

git pull origin main
git branch --set-upstream-to=origin/main main
