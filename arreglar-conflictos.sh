#!/bin/bash
#
echo " "
echo "Escoga segun su necesidad"
while :
do
        echo "---------------------------------------"
        echo "1.- CONFIGURACIÓN PREVIA"
        echo "2.- REALIZAR MERGE"
        echo "0.- CERO PARA SALIR DEL SCRIPT"
        echo "_____________"
 
        echo -n "Su opción elegida es el número ==> "
 
        read opcion
        case $opcion in
 
1)
echo "CONFIGURACIÓN PREVIA"
 
read -p "Ingresa tu usuario de red: " usuario
read -p "Ingresa tu correo bcp: " correo
 
git init
git config --global http.sslVerify false
git config --global user.name "$usuario"
git config --global user.email $correo
#git config --global http.postBuffer 524288000
#git config --global http.lowSpeedLimit 0
#git config --global http.lowSpeedTime 999999
 
echo "-----------------------"
echo "Configuración Realizada"
echo "_________"
 
;;
 
2)
echo "REALIZAR MERGE"
echo "--------------"
#
read -p "Ingresar el git clone del pase: " gitclone
read -p "Ingresar el mvl del pase: " mvl
#
git clone $gitclone --branch master --single-branch
REPO_NAME=$(basename "$gitclone" .git)
cd $REPO_NAME
git checkout master
git pull --strategy-option theirs origin release/$mvl --allow-unrelated-histories
git status
git add .
git commit -m "Merged release/$mvl into master"
git push origin master
echo "----------------"
echo "MERGER REALIZADO"
echo "______"
cd ..
 
;;
 
0) echo "Opcion cero para salir del script, chauuu" ; exit 0
 
esac
done