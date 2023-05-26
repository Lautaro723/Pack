#!/bin/bash
source colores.sh
clear
trap ctrl_c INT 

ctrl_c(){
clear
echo -e "$azul

          █░░ █▀▀ ▄▄ █▀█ █▀▀ █▄█ █▄░█ ▄▀█
          █▄▄ █▄█ ░░ █▀▄ ██▄ ░█░ █░▀█ █▀█
${verde}        ┌═════════════════════════════════┐
${verde}        |$cyan Somos legion reyna no olvidamos $verde|
${verde}        |$cyan     no perdonamos esperanos     $verde|
${verde}        └═════════════════════════════════┘
"
exit
}
echo -e "${azul}

     ██████╗░░█████╗░░█████╗░██╗░░██╗
     ██╔══██╗██╔══██╗██╔══██╗██║░██╔╝
     ██████╔╝███████║██║░░╚═╝█████═╝░
     ██╔═══╝░██╔══██║██║░░██╗██╔═██╗░
     ██║░░░░░██║░░██║╚█████╔╝██║░╚██╗
     ╚═╝░░░░░╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝
$azul   ┌═════════════════════════════════┐
$azul   |${GREEN}  $rojo Bienvenido ala herramienta  ${GRAY}$azul  |
$azul   └═════════════════════════════════┘

$cyan aprete enter para ver el menu de opciones "

while :
do


legion_reyna='\033[42m'

read -p $'\e\033[38;5;31m >>\e\033[0;30m \e\033[5;52m' PACK


if [ -r $PACK  ];then
clear
echo -e "
$azul       ┌══════════════════════════════┐
$azul       |${legion_reyna}  $rojo menu de herramienta PACK   ${GRAY}$azul|
$azul       └══════════════════════════════┘

${azul}[${cyan}>${rojo} 1${cyan}<${azul}]${verde}VidPhisher
${azul}[${cyan}>${rojo} 2${cyan}<${azul}]${verde}num-info
${azul}[${cyan}>${rojo} 3${cyan}<${azul}]${verde}Ip-info
${azul}[${cyan}>${rojo} 4${cyan}<${azul}]${verde}Seeker
${azul}[${cyan}>${rojo} 5${cyan}<${azul}]${verde}Salir
"
elif [ ${PACK} = 1 ]; then
apt update && apt upgrade -y
apt install git 
git clone https://github.com/KasRoudra/VidPhisher
cd VidPhisher
termux-setup-storage
bash vp.sh
elif [ ${PACK} = 2 ]; then
clear
 echo "ingresa un numero telefonico"

while :
do
read -p $'\e\033[34m>> \e\033[36m' num
if [ -r $num ];then
echo "no as ingresado un numero para obtener info "


else

number=$num
apikey="9FnE4XyrQ4vi9Fni7UF58PFX1bzdRWgd"      
response=$(curl --request GET "https://api.apilayer.com/number_verification/validate?number=$number" --header "apikey:$apikey" 2>/dev/null)  

valid=$(echo "$response" | jq -r '.valid')
number=$(echo "$response" | jq -r '.number')
country_name=$(echo "$response" | jq -r '.country_name')
country_code=$(echo "$response" | jq -r '.country_code')
location=$(echo "$response" | jq -r '.location')
carrier=$(echo "$response" | jq -r '.carrier')
line_type=$(echo "$response" | jq -r '.line_type')
local_format=$(echo "$response" | jq -r '.local_format')
international_format=$(echo "$response" | jq -r '.international_format')

clear
echo -e "$verde┌═════════════════════════════════════════════┐"
echo -e "$verde┃${azul} Datos obtenidos del número $number ${cyan}    |"
echo -e "$verde└═════════════════════════════════════════════┘"
echo -e "$verde ┃"
echo -e "$verde └══>$azul Número:$cyan $number"
echo -e "$verde ┃"
echo -e "$verde └══>$azul País:$cyan $country_name ($country_code)"
echo -e "$verde ┃"
echo -e "$verde └══>$azul Ubicación:$cyan $location"
echo -e "$verde ┃"
echo -e "$verde └══>$azul Operador:$cyan $carrier"
echo -e "$verde ┃"
echo -e "$verde └══>$azul Tipo de línea:$cyan $line_type"
echo -e "$verde ┃"
echo -e "$verde └══>$azul Formato local:$cyan $local_format"
echo -e "$verde ┃"
echo -e "$verde └══>$azul Formato internacional:$cyan $international_format"
fi
done
elif [ ${PACK} = 3 ]; then
clear 
read -p $'\e\033[38;5;32m Ingresa una ip\e\033[38;5;36m ' ip
if [ -r $ip ];then
curl ip-api.com/$1
else 
response=$(curl -s "https://ipapi.co/$ip/json/")
country=$(echo $response | jq -r '.country_name')
        region=$(echo $response | jq -r '.region')
        city=$(echo $response | jq -r '.city')
        latitude=$(echo $response | jq -r '.latitude')
        longitude=$(echo $response | jq -r '.longitude')
        postal=$(echo $response | jq -r '.postal')
clear
        echo -e "
$verde┌═════════════════════════════════════════════┐
$verde┃${azul} Datos obtenidos dirección IP${cyan} $ip ${verde}   ┃
$verde└═════════════════════════════════════════════┘
$verde ┃
$verde └══>$azul pais:$cyan $country
$verde ┃
$verde └══>$azul region:$cyan $region
$verde ┃
$verde └══>$azul cyudad:$cyan $city
$verde ┃
$verde └══>$azul codigo postal: $cyan $postal
$verde ┃
$verde └══>$azul Latitud:$cyan $longitude
$verde ┃
$verde └══>$azul Longitud:$cyan $longitude
"
fi 
elif [ ${PACK} = 4 ]; then
echo "instalando seeker"
git clone https://github.com/thewhiteh4t/seeker.git

cd seeker/

chmod +x install.sh

./install.sh
elif [ ${PACK} = 5 ]; then
echo "gracias por usar pack "
exit
else
echo  -e "$azul[${verde}>${cyan} LA OPCION $azul$PACK$cyan NO EXISTE$verde <$azul] "


fi 

done
