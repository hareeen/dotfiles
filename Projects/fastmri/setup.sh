cd /root/burning_gpu

git pull origin main

mlflow ui --port 5000 --host 0.0.0.0 &
detach
