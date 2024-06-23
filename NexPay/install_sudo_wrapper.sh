#!/bin/bash

# Create the sudo wrapper script
cat << 'EOF' > /usr/local/bin/sudo_wrapper.sh
#!/bin/bash

# Define the command to be executed with sudo
COMMAND="$@"

# Try to retrieve the passkey from the keychain
PASSWORD=$(security find-generic-password -a "$USER" -s "sudo_password" -w 2>/dev/null)

if [ $? -eq 0 ]; then
    # Passkey found, try to use it with sudo
    echo "$PASSWORD" | sudo -S $COMMAND
    # Check if sudo succeeded
    if [ $? -eq 0 ]; then
        exit 0
    fi
fi

# If passkey not found or sudo failed, fallback to regular sudo prompt (which now includes Touch ID)
sudo $COMMAND
EOF

# Make the script executable
chmod +x /usr/local/bin/sudo_wrapper.sh

# Add the alias to the shell configuration
SHELL_CONFIG="$HOME/.bashrc"
if [ -n "$ZSH_VERSION" ]; then
  SHELL_CONFIG="$HOME/.zshrc"
fi

# Ensure the alias isn't added multiple times
grep -qxF 'alias sudo="/usr/local/bin/sudo_wrapper.sh"' "$SHELL_CONFIG" || echo 'alias sudo="/usr/local/bin/sudo_wrapper.sh"' >> "$SHELL_CONFIG"

# Source the shell configuration
source "$SHELL_CONFIG"

# Add the sudo password to the keychain
echo "Adding sudo password to the keychain..."
security add-generic-password -a "$USER" -s "sudo_password" -w

# Modify the sudoers file to include Touch ID
echo "Modifying the sudoers file to include Touch ID..."
sudo sed -i '' '1 i\
auth       sufficient     pam_tid.so\
' /etc/pam.d/sudo

echo "Installation complete. Please open a new terminal or source your shell configuration to start using the sudo wrapper."
