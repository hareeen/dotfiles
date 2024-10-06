cd ~/AShotChu

fuser -k 5000/tcp
mlflow ui --port 5000 --host 0.0.0.0 &
disown
