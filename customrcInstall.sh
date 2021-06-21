if (grep -F 'source ~/.customrc' ~/.bashrc &> /dev/null) then
  echo ".customrc already found in .bashrc"
else
  echo "Adding source ~/.customrc to .bashrc file"
  printf "\n" >> ~/.bashrc
  printf "source ~/.customrc" >> ~/.bashrc
  printf "\n" >> ~/.bashrc
fi

if ! type "exa" &> /dev/null; then
  echo "No exa command detected. Installing..."
  temp=$(curl -s https://api.github.com/repos/ogham/exa/releases/latest \
    | grep "browser_download_url" \
    | grep "exa-linux-x86_64-v" \
    | grep "zip" \
    | cut -d '"' -f 4)
  wget $temp -q --show-progress -P ~
  temp=$(echo $temp | cut -d "/" -f 9)
  unzip ~/$temp bin/exa -d ~
  rm ~/$temp
else
  echo "exa is already installed"
fi

if [ ! -f ~/.customrc ]; then
  echo "Downloading .customrc"
  wget https://raw.githubusercontent.com/sebafudi/linux-conf/main/.customrc -q --show-progress -P ~
else
  echo ".customrc already found"
fi
