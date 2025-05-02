import subprocess
import sys
import os
import requests

def install(package):
    """Install a package using pip."""
    try:
        subprocess.check_call([sys.executable, "-m", "pip", "install", package])
        print(f"Successfully installed {package}")
    except subprocess.CalledProcessError:
        print(f"Failed to install {package}")

def download_and_install_kvaser():
    """Download and install the Kvaser driver from the provided link."""
    url = "https://www.kvaser.com/download/?utm_source=software&utm_ean=7330130980150&utm_status=latest"
    file_name = "kvaser_driver.exe"
    
    try:
        # Download the file
        print(f"Downloading Kvaser driver from {url}...")
        response = requests.get(url, stream=True)
        response.raise_for_status()
        
        with open(file_name, "wb") as file:
            for chunk in response.iter_content(chunk_size=8192):
                file.write(chunk)
        print(f"Downloaded {file_name} successfully.")
        
        # Run the installer with elevated privileges
        print(f"Running the installer for {file_name} with admin privileges...")
        subprocess.check_call(["powershell", "-Command", f"Start-Process '{file_name}' -Verb runAs"])
        print("Kvaser driver installed successfully.")
        
        # Clean up the installer file
        os.remove(file_name)
        print(f"Removed installer file {file_name}.")
    except requests.RequestException as e:
        print(f"Failed to download the Kvaser driver: {e}")
    except subprocess.CalledProcessError:
        print(f"Failed to install the Kvaser driver.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

# List of packages to install
packages = ["python-can", "keyboard", "canlib"]

for package in packages:
    install(package)

# Download and install the Kvaser driver
download_and_install_kvaser()