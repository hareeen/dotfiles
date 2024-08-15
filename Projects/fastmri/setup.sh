cd /root/burning_gpu

git pull origin main
git branch --set-upstream-to=origin/main main

mlflow ui --port 5000 --host 0.0.0.0 &
disown
