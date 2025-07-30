#!/bin/bash

# AiGod Lite CLI Launcher
echo "🔥 Launching AiGod Lite CLI..."

# Check if Python is installed
if ! command -v python &> /dev/null; then
    echo "[!] Python is not installed. Installing..."
    pkg update -y && pkg install python -y
fi

# Create AiGod working directory
mkdir -p $HOME/aigod-lite
cd $HOME/aigod-lite

# Create basic CLI structure
cat <<EOF > aigod.py
print("🤖 Welcome to AiGod Lite CLI")
while True:
    try:
        cmd = input("aigod> ")
        if cmd in ['exit', 'quit']: break
        exec(cmd)
    except Exception as e:
        print("Error:", e)
EOF

# Create runner
cat <<EOF > run.sh
#!/bin/bash
python $HOME/aigod-lite/aigod.py
EOF

chmod +x run.sh

echo "✅ AiGod Lite installed."
echo "👉 To run: cd ~/aigod-lite && ./run.sh"
