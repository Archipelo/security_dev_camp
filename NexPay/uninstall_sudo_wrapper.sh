#!/bin/bash

# Remove the alias from the shell configuration
SHELL_CONFIG="$HOME/.bashrc"
if [ -n "$ZSH_VERSION" ]; then
  SHELL_CONFIG="$HOME/.zshrc"
fi

# Remove the alias line
sed -i '' '/alias sudo="\/usr\/local\/bin\/sudo_wrapper.sh"/d' "$SHELL_CONFIG"

# Remove the script
rm -f /usr/local/bin/sudo_wrapper.sh

# Remove the keychain item
security delete-generic-password -a "$USER" -s "sudo_password"

# Restore the sudoers file to its original state (remove the pam_tid line)
sudo sed -i '' '/auth       sufficient     pam_tid.so/d' /etc/pam.d/sudo

# Source the shell configuration
source "$SHELL_CONFIG"

echo "Uninstallation complete. Please open a new terminal or source your shell configuration to stop using the sudo wrapper."
