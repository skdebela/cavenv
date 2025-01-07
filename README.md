# cavenv

**cavenv** is a simple and flexible bash script that helps you create and activate Python virtual environments easily.
It allows you to specify the location of the virtual environment or defaults to creating one in the current directory (`./.venv`).

## Features

- Create and activate Python virtual environments.
- Support for custom directory paths for virtual environments.
- Easy installation and usage.
- Minimal dependencies (only Python is required).

## Installation

### 1. Download or Clone the Repository

You can either clone the repository or download the project files to your local machine.

#### Clone with Git

```bash
git clone https://github.com/your-username/cavenv.git
cd cavenv
```

### 2. Install cavnenv

```bash
chmod +x install.sh
./install.sh
```

This will:

- Install `cavenv.sh` to `$HOME/.local/bin`
- Make the script executable
- Source it to bashrc (if it is not already there)

After installation, restart your terminal or source your bashrc to start using `cavenv` from any directory in your terminal.

```bash
source ~/.bashrc
```

### 3. Verify the Installation

To verify that `cavenv` was installed correctly, open a new terminal and run:

```bash
cavenv --version
```

This should display the version of `cavenv` (e.g., `cavenv version 0.0.1`).

## Usage

### Create and Activate the Default Virtual Environment

By default, `cavenv` will create and activate a virtual environment in the current directory (`./.venv`):

```bash
cavenv
```

### Create and Activate a Virtual Environment at a Specific Directory

To create and activate a virtual environment at a specific location, provide the path as an argument:

```bash
cavenv /path/to/venv
```

## Example

```bash
# Create and activate the default virtual environment
cavenv

# Create and activate a virtual environment called "myvenv" in the current directory
cavenv myvenv

# Create and activate a virtual environment in a custom location
cavenv ~/myprojects/envs/myvenv
```

## Requirements

- **Python**: `cavenv` requires Python to be installed on your system. It uses `python -m venv` to create the virtual environment.

To check if Python is installed, run:

```bash
python --version
```

If Python is not installed, please install it first.
