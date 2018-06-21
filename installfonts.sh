#!/bin/bash
TYPE=$1

function	banner(){
	echo "                                            "
	echo "                     ---                    "
	echo "           --- INSTALL FONTS ---            "
	echo "                     ---                    "
	echo "                                            "
}

function	installFont(){
	banner
	shopt -s extglob
	sudo cp *.$1 "/usr/share/fonts"
	if [ $? -eq 0 ]; then
		fc-cache -f -v /usr/share/fonts
	else
		echo "[ * ] Nenhum arquivo com a extenção .$1 foi encontrado."
	fi
}

function	helpContent(){
	banner
	echo "[ * ] Use como argumento: ttf ou otf"
	echo ""
}

if [ "$TYPE" == "ttf" ] || [ "$TYPE" == "otf" ]; then
	installFont $TYPE
else
	helpContent
fi