# Sudo Wrapper

The `sudo_wrapper` script enhances the security and convenience of using `sudo` on macOS by integrating Touch ID and password storage in the Keychain. This tool attempts to use the password from the Keychain, falls back to the passkey authentication with TouchID and if it is not successful to regular `sudo` prompt.

## Features

- **Touch ID Integration**: Securely authenticate `sudo` commands using your Mac's Touch ID.
- **Keychain Integration**: Store and retrieve `sudo` passwords from the macOS Keychain for seamless authentication.
- **Fallback Mechanism**: Automatically fall back to the standard `sudo` prompt if the Keychain password is not found or authentication fails.
- **Enhanced Security**: Reduce the need to frequently enter your password, minimizing the risk of password exposure.
- **Improved Workflow**: Streamline your development workflow with fast and secure `sudo` authentication.

## Advantages

### Enhanced Security

By leveraging Touch ID and the Keychain, the `sudo_wrapper` script significantly improves security for developers:
- **Touch ID**: Uses biometric authentication, which is more secure than passwords.
- **Keychain**: Ensures that passwords are stored securely and only accessible by authorized applications.

### Improved Developer Workflow

The `sudo_wrapper` script simplifies and speeds up the process of using `sudo`:
- **Convenience**: No need to type your password every time you run a `sudo` command.
- **Efficiency**: Fast and seamless authentication using Touch ID.
- **Focus**: Allows you to concentrate on development tasks without frequent interruptions for password entry.

## Installation

### Prerequisites

- macOS with Touch ID.
- Xcode Command Line Tools installed.

### Steps

1. **Run the Installation Script**:
    ```sh
    chmod +x install_sudo_wrapper.sh
    ./install_sudo_wrapper.sh
    ```

2. **Open a new terminal or source your shell configuration** to apply the changes:
    ```sh
    source ~/.bashrc # for bash
    source ~/.zshrc  # for zsh
    ```

## Uninstallation

1. **Run the Uninstallation Script**:
    ```sh
    chmod +x uninstall_sudo_wrapper.sh
    ./uninstall_sudo_wrapper.sh
    ```

2. **Open a new terminal or source your shell configuration** to apply the changes:
    ```sh
    source ~/.bashrc # for bash
    source ~/.zshrc  # for zsh
    ```

## Usage

After installation, you can use `sudo` as usual, and the wrapper script will handle authentication using Touch ID or the password from the Keychain.

Example:
```sh
sudo ls /var/root
```
    
The script will attempt to retrieve the password from the Keychain and use it with sudo. If the password is not found, it will fall back to the passkey authentication with TouchID and if that will not be successful as well to regular sudo prompt.

## Conclusion

The sudo_wrapper script is a valuable tool for developers looking to enhance their workflow's security and efficiency. By integrating Touch ID and the Keychain, this tool provides a seamless and secure way to handle sudo authentication, allowing you to focus more on development tasks and less on repetitive password entry.
