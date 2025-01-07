#!/bin/bash

# Default virtual environment location
DEFAULT_VENV="./.venv"

# Version of the cavenv script
CAVENV_VERSION="0.0.2"

# Function to display usage information
usage() {
    echo "Usage: cavenv [OPTIONS] [DIRECTORY]"
    echo "Create and activate a Python virtual environment."
    echo ""
    echo "Options:"
    echo "  -h, --help        Show this help message"
    echo "  -v, --version     Show version"
    echo "  -f, --force       Force creation even if directory exists"
    echo "  -n, --no-install  Do not install python dependencies from requirements.txt file"
    echo "  [DIRECTORY]       Directory to create the virtual environment (defaults to $DEFAULT_VENV)"
}

# Print version
version() {
    echo "cavenv version $CAVENV_VERSION"
}

# Check if Python is installed
check_python() {
    if ! command -v python &>/dev/null && ! command -v python3 &>/dev/null; then
        echo "Python is not installed. Please install Python first."
        return 1
    fi
}

# Check if the directory exists (unless -f is used)
check_directory() {
    if [ -d "$1" ] && [ -z "$FORCE" ]; then
        echo "Directory '$1' already exists. Use -f or --force to overwrite."
        return 1
    fi
}

# Create and activate the virtual environment
create_and_activate_venv() {
    local dir=${1:-$DEFAULT_VENV}

    # Check if the directory exists (unless -f is used)
    check_directory "$dir"

    # Create the virtual environment
    echo "Creating virtual environment at $dir..."
    if command -v python3 &>/dev/null; then
        python3 -m venv "$dir"
    else
        python -m venv "$dir"
    fi

    if [ $? -eq 0 ]; then
        echo "Virtual environment created at $dir."
        # Activate the virtual environment
        source "$dir/bin/activate"
        echo "Virtual environment $dir activated."
    else
        echo "Failed to create virtual environment at $dir."
        return 1
    fi
}

install_requirements() {
    if [ -f "./requirements.txt" ] && [ -z "$INSTALL_DEPENDENCIES" ]; then
        echo "requirements file 'requiremnts.txt' found in current directory."
        echo "Installing requirements use flag '-n|--no-dependencie' to disable automatic requirements installation."
        pip install -r requirements.txt
    else
        return 0
    fi

}

cavenv() {
    # Parse options
    FORCE=""
    INSTALL_DEPENDENCIES=""
    while [[ "$1" =~ ^- ]]; do
        case "$1" in
            -h|--help)
                usage
                return 0
                ;;
            -v|--version)
                version
                return 0
                ;;
            -f|--force)
                FORCE="true"  # Set FORCE to allow overwriting
                shift
                ;;
            -n|--no-install)
                INSTALL_DEPENDENCIES="false" # Set INSTALL_DEPENDENCIES to false to not install dependencies
                shift
                ;;
            *)
                echo "Unknown option: $1"
                usage
                return 1
                ;;
        esac
    done

    # If no directory argument is given, use the default
    venv_dir=${1:-$DEFAULT_VENV}
    
    # Run the function
    check_python
    create_and_activate_venv "$venv_dir"
    install_requirements
}

