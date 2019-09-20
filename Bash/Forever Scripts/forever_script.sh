

while echo "Running"; do
  # Failure: Logging date txt file
  date >> "$(pwd)"/log_forever_script.txt
  sleep 2
done
