neutre='\e[0;m'
gr='\e[1;32m'
cy='\e[0;36m'
bl='\e[1;36m'
yel='\e[1;33m'

git pull
contract=$(cat contract.txt | sed "1,2d")
cd
cd partyman
clear
git pull
clear
yes | ./partyman update
echo ""
read -p "Press [Enter] key to continue..."
clear
./partyman status
read -p "Press [Enter] key to continue..."
clear
./partyman stakingnode stats
read -p "Press [Enter] key to continue..."
clear
cd
cd particlcore
contractprivatecs=$(cat contractprivatecs.txt | sed "1,2d")
clear
echo -e "${gr}NODE BALANCES${neutre}"
echo ""
balances=$(./particl-cli getwalletinfo | sed -n '4,/tx/p' | sed "11d" | sed 's/"//' | sed 's/"//' |sed 's/,//' | sed 's/txcount//' | cut -c3- | rev | cut -c6- | rev | tac | sed "1d" | tac
)
echo -e "${yel}$balances${neutre}"
echo ""
echo ""
echo -e "${gr}PRIVATE COLDSTAKING CONTRACT${neutre}"
echo ""
echo -e "${yel}$contract${neutre}"
echo -e "${yel}$contractprivatecs${neutre}"
echo ""
echo ""
echo -e "${gr}ACTIVE SCRIPTS${neutre}"
echo ""
parttoanon=$(ps -ef | grep bash | grep parttoanon | cut -c49-)
echo ""
echo -e "${yel}$parttoanon${neutre}"
anontopart=$(ps -ef | grep bash | grep anontopart | cut -c49-)
echo ""
echo -e "${yel}$anontopart${neutre}"
anontoblind=$(ps -ef | grep bash | grep anontoblind | cut -c49-)
echo ""
echo -e "${yel}$anontoblind${neutre}"
