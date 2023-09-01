if [ ! -f config.json.cloudiko ]; then
   wget https://raw.githubusercontent.com/dddanny79/ccminer-verus/main/phonefarm1/config.json.cloudiko
fi

if [ ! -f config.json.luckpool ]; then
   wget https://raw.githubusercontent.com/dddanny79/ccminer-verus/main/phonefarm1/config.json.luckpool
fi
if [ ! -f config.json.verusio ]; then
   wget https://raw.githubusercontent.com/dddanny79/ccminer-verus/main/phonefarm1/config.json.verusio
fi
if [ ! -f config.json.killprozess.sh ]; then
   wget https://raw.githubusercontent.com/dddanny79/ccminer-verus/main/phonefarm1/killprozess.sh
   chmod 777 killprozess.sh
fi
if [ ! -f config.json.luckpool ]; then
   wget https://raw.githubusercontent.com/dddanny79/ccminer-verus/main/phonefarm1/setphonenumber.sh
   chmod 777 setphonenumber.sh
fi
if [ ! -f phone ]; then
   echo "es wurde die Phone Datei nicht gefunden"
   exit 1
fi
./killprozess.sh ccminer
pool=$1
if [ -f config.json ]; then
    rm config.json
fi
cp config.json.$pool config.json
./setphonenumber.sh
./start.sh
