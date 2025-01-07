#!/bin/bash

# Define the installation directory
INSTALL_DIR="$HOME/.local/bin"

# Create installation directory if it doesn't exist
if [ ! -d "$INSTALL_DIR" ]; then
    echo "Creating installation directory $INSTALL_DIR"
    mkdir -p "$INSTALL_DIR"
fi

# Copy the cavenv.sh script to the installation directory
echo "Installing cavenv to $INSTALL_DIR"
cp src/cavenv.sh "$INSTALL_DIR/cavenv"

# Make both scripts executable
chmod +x "$INSTALL_DIR/cavenv"

# Add the program to bashrc
if ! grep -q "# cavenv" "$HOME/.bashrc"; then
    echo "Sourcing program to $HOME/.bashrc"
    echo -e "# cavenv\nif [ -f $INSTALL_DIR/cavenv ]; then\n\tsource $INSTALL_DIR/cavenv\nfi\n" >> "$HOME/.bashrc"
fi

# Inform the user of the successful installation
echo "cavenv has been installed successfully!"
echo "You can now use it by running 'cavenv' from any terminal."
echo "Please restart your terminal or run 'source ~/.bashrc' for the changes to take effect."

