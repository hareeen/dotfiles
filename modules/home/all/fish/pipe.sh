# Pipe every interactive shell to fish
if [[ -t 0 ]]; then
  fish
  exit 0
fi
