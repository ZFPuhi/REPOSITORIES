#!/bin/bash

function echo_green {
    echo -e "\e[32m$1\e[0m"
}

function echo_red {
    echo -e "\e[31m$1\e[0m"
}

function echo_yellow {
    echo -e "\e[33m$1\e[0m"
}

# Checking if there are any running containers with 'diablo4trading' in the name
matching_containers=$(docker ps -q --filter "name=diablo4trading")

# If there are no matching containers, exit with a message
if [ -z "$matching_containers" ]; then
  echo_green "No containers with 'diablo4trading' in the name are currently running."
else
  # Stopping each matching container
  echo_yellow "Stopping containers with 'diablo4trading' in the name..."
  for container_id in $matching_containers; do
    echo_green "Stopping container: $container_id"
    docker kill $container_id
  done

  echo_green "All matching containers have been forcefully stopped."
fi

# Copying the .env file from the Back and Front end directory
echo_yellow "Copying the .env file from the Back and Front end directory..."
sudo cp -f diablo4trading-be/.env .
sudo cp -f diablo4trading-fe/.env .

echo_yellow "Finished with copying the .env file."

# Deleting existing directories for the back/front end and the shared one. If you do not wish to delete all simply comment out the command.
echo_red "Deleting any existing directory of the Diablo 4 Trading repository..."
sudo rm -rf diablo4trading-be/
sudo rm -rf diablo4trading-fe/
sudo rm -rf shared/

echo_green "All existing directories have been deleted."

# Adding a 5-second sleep before each Git clone
sleep 5

# Cloning Diablo4trading Back End Repository
echo_yellow "Starting Git Clone for Diablo4trading Back End Repository..."
sudo git clone https://github.com/SanctuaryTeam/diablo4trading-be.git
echo_green "Finished with Cloning the Back End of the Diablo4Trading Repository."

# Adding a 5-second sleep before the next Git clone
sleep 5

# Cloning Diablo4trading Front End Repository
echo_yellow "Starting Git Clone for Diablo4trading Front End Repository..."
sudo git clone https://github.com/SanctuaryTeam/diablo4trading-fe.git
echo_green "Finished with Cloning the Front End of the Diablo4Trading Repository."

# Adding a 5-second sleep before the next Git clone
sleep 5

# Cloning Diablo4trading Shared Repository
echo_yellow "Starting Git Clone for Diablo4trading Shared Repository..."
sudo git clone https://github.com/SanctuaryTeam/shared.git
echo_green "Finished with Cloning the Shared Repository of Diablo4Trading Project."

echo_green "All needed repositories of the Diablo 4 Trading Project have been cloned."

# Copying the .env file to the needed directories
echo_green "Copying the .env file to the needed directories..."
sudo cp .env diablo4trading-be/
sudo cp .env diablo4trading-fe/

echo_green "All processes have been completed."
