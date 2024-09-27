# set working directory
cd /root/burning_gpu

# pull latest changes
git pull origin main
git branch --set-upstream-to=origin/main main

# open mlflow ui
fuser -k 5000/tcp
mlflow ui --port 5000 --host 0.0.0.0 &
disown

# mount backblaze
if [ ! -f /etc/passwd-s3fs ]; then
    echo "$KEY" > /etc/passwd-s3fs
    chmod 640 /etc/passwd-s3fs
fi

mkdir -p /mnt/ckpts
s3fs ckpts /mnt/ckpts -o passwd_file=/etc/passwd-s3fs -o url=https://s3.us-east-005.backblazeb2.com || true
