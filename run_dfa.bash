CORE="dfa.bc"
CONFIG=$1

if [ ! -f "$CORE" ]; then
    echo "Error: Core file '$CORE' not found"
    exit 1
fi

if [ -z "$CONFIG" ]; then
    echo "    ---- Usage: ./run_dfa.bash <path_to_config_file>"
    exit 1
fi

if [ ! -f "$CONFIG" ]; then
    echo "    ---- Error: Config file '$CONFIG' not found!"
    exit 1
fi

read -p "Enter string to test: " user_input

input_calls=""
for (( i=0; i<${#user_input}; i++ )); do
    input_calls="${input_calls}d(${user_input:$i:1});"
done

(
  cat "$CORE"
  cat "$CONFIG"
  echo "begin_input();"
  echo "$input_calls"
  echo "end_input();"
  echo "run_machine();"
  echo "quit;"
) | bc -q | grep -v '^[0-9]\+$'
