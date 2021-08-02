#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt install python3;
sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools
sudo apt-get install -y libldns-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip
sudo apt-get install -y python-dnspython
sudo apt-get install -y git
sudo apt-get install -y rename
sudo apt-get install -y xargs

echo "installing bash_profile aliases from recon_profile"
cd recon
cat bash >> ~/.bash_profile
source ~/.bash_profile
cd ~/tools/
echo "done"

#install go
if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					echo "Installing Golang"
					wget https://dl.google.com/go/go1.16.6.linux-amd64.tar.gz
					sudo tar -xvf go1.16.6.linux-amd64.tar.gz
					sudo mv go /usr/local
					export GOROOT=/usr/local/go
					export GOPATH=$HOME/go
					export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
					echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
					echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
					echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
					source ~/.bash_profile
					sleep 1
					break
					;;
				no)
					echo "Please install go and rerun this script"
					echo "Aborting installation..."
					exit 1
					;;
	esac	
done
fi


#Don't forget to set up AWS credentials!
echo "Don't forget to set up AWS credentials!"
apt install -y awscli
echo "Don't forget to set up AWS credentials!"



#create a tools folder in ~/
mkdir ~/tools
cd ~/tools/

#install amass
echo "Installing Amass"
go get -v github.com/OWASP/Amass/v3/...;
echo "done"

#install findomain
echo "Installing Amass"
git clone https://github.com/findomain/findomain.git;
cd ~/tools/
echo "done"

#install assetfinder
echo "Installing assetfinder"
go get -u github.com/tomnomnom/assetfinder
echo "done"

#install subfinder
echo "Installing subfinder"
GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/cmd/subfinder;
echo "done"

#install Sublist3R
echo "Installing Sublist3R"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
pip3 install -r requirements.txt
sudo python3 setup.py install
cd ~/tools/
echo "done"

#install httprobe
echo "installing httprobe"
go get -u github.com/tomnomnom/httprobe 
echo "done"

#install massdns
echo "installing massdns"
git clone https://github.com/blechschmidt/massdns.git
cd ~/tools/massdns
make
cd ~/tools/
echo "done"

#install ParamSpider
echo "installing ParamSpider"
git clone https://github.com/devanshbatham/ParamSpider
cd ParamSpider
pip3 install -r requirements.txt
cd ~/tools/
echo "done"

#install arjunfinder
pip3 install arjun

#install gau
echo "installing Gau"
GO111MODULE=on go get -u -v github.com/lc/gau;
echo "done"

#install waybackurls
echo "installing waybacjurls"
go get github.com/tomnomnom/waybackurls
echo "done"

#install dalfox
echo "installing dalfox"
GO111MODULE=on go get -u -v github.com/hahwul/dalfox;
echo "done"

#install kxss
echo "installing kxss"
go get github.com/Emoe/kxss
echo "done"

#install gf tools and gfpattern
echo "installing gfpattern"
go get -u github.com/tomnomnom/gf
echo "[*] Installing Gf-patterns..."
git clone -q https://github.com/1ndianl33t/Gf-Patterns
echo "done"

#install aquatone
echo "Installing Aquatone"
go get github.com/michenriksen/aquatone
echo "done"

#install chromium
echo "Installing Chromium"
sudo snap install chromium
cd ~/tools/
echo "done"

echo "installing JSParser"
git clone https://github.com/nahamsec/JSParser.git
cd JSParser*
sudo python setup.py install
cd ~/tools/
echo "done"


echo "installing teh_s3_bucketeers"
git clone https://github.com/tomdev/teh_s3_bucketeers.git
cd ~/tools/
echo "done"


echo "installing wpscan"
git clone https://github.com/wpscanteam/wpscan.git
cd wpscan*
sudo gem install bundler && bundle install --without test
cd ~/tools/
echo "done"

echo "installing dirsearch"
git clone https://github.com/maurosoria/dirsearch.git
cd ~/tools/
echo "done"


echo "installing lazys3"
git clone https://github.com/nahamsec/lazys3.git
cd ~/tools/
echo "done"

echo "installing virtual host discovery"
git clone https://github.com/jobertabma/virtual-host-discovery.git
cd ~/tools/
echo "done"


echo "installing sqlmap"
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
cd ~/tools/
echo "done"

echo "installing knock.py"
git clone https://github.com/guelfoweb/knock.git
cd ~/tools/
echo "done"

echo "installing lazyrecon"
git clone https://github.com/nahamsec/lazyrecon.git
cd ~/tools/
echo "done"

echo "installing nmap"
sudo apt-get install -y nmap
echo "done"

echo "installing asnlookup"
git clone https://github.com/yassineaboukir/asnlookup.git
cd ~/tools/asnlookup
pip install -r requirements.txt
cd ~/tools/
echo "done"

echo "installing unfurl"
go get -u github.com/tomnomnom/unfurl 
echo "done"

echo "installing crtndstry"
git clone https://github.com/nahamsec/crtndstry.git
echo "done"

echo "downloading Seclists"
cd ~/tools/
git clone https://github.com/danielmiessler/SecLists.git
cd ~/tools/SecLists/Discovery/DNS/
##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
cd ~/tools/
echo "done"


git clone https://github.com/GerbenJavado/LinkFinder;
git clone https://github.com/m4ll0k/SecretFinder;
git clone https://github.com/s0md3v/Corsy.git;
git clone https://github.com/hisxo/gitGraber.git;
git clone https://github.com/lobuhi/byp4xx.git;

GO111MODULE=on go get -u -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei;
git clone https://github.com/projectdiscovery/nuclei-templates;
go get github.com/hakluke/hakrawler;
GO111MODULE=on go get -v github.com/projectdiscovery/dnsx/cmd/dnsx
go get github.com/haccer/subjack;
go get -u github.com/ffuf/ffuf;
GO111MODULE=on go get -v github.com/projectdiscovery/naabu/v2/cmd/naabu;
GO111MODULE=on go get -u -v github.com/projectdiscovery/httpx/cmd/httpx;


echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up in ~/tools"
ls -la
echo "One last time: don't forget to set up AWS credentials in ~/.aws/!"