# To run the jobs on different platforms, you can use the following commands:
jobs:
  build:
    runs-on: ${{metrics.os}}
    statrategy:
      matrix:
        os: [ubuntu-latest, windows-latest, macOS-latest]
    OR
    runs-on: ${{metrics.os}}-latest
    statrategy:
      matrix:
        os: [ubuntu, windows, macos]


# Similarly, you can run the jobs on different JDK versions using the following commands:
jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        java-version: [ '21', '25' ]


# sudo apt update && sudo apt install -y bzip2
# sudo chmod 666 /var/run/docker.sock

# Run the following command to uninstall all conflicting packages:
sudo apt remove $(dpkg --get-selections docker.io docker-compose docker-compose-v2 docker-doc docker-buildx podman-docker containerd runc | cut -f1)

# Install Docker using the apt repository
1. Set up Docker's apt repository.
# Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update

2. Install the Docker packages.
   sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# After installation, verify that Docker is running:
    sudo systemctl status docker
# If Docker is not running, start it manually:
    sudo systemctl start docker
3. Verify that the installation is successful by running the hello-world image:
   sudo docker run hello-world