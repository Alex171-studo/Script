#!/bin/bash


echo "Bienvenu dans votre gestionnaire de fichiers"
echo "============================================"
sleep 1
[ ! -d Documents ] && mkdir Documents
[ ! -d Images ] && mkdir Images
[ ! -d Videos ] && mkdir Videos
total=0

if [ -n "$(find . -maxdepth 1 -name "*.txt" -o -name "*.dox" -o -name "*.docx") 2>/dev/null" ]; then
    echo "Il n'existe aucun document de disponible"
else
    mv "*.txt"  "*.doc" --*.docx Documents/
    echo "Les images ont bien été déplacées"
    ((total+=1))
fi
echo " "
sleep 1

nombre=$(ls *.jpeg *png 2>/dev/null | wc -l)
if [[ "$nombre" == 0 ]]; then
    echo "Vous n'avez aucune images de disponible"

else
    mv *.jpeg *.png Images/
    echo "Les images ont bien été déplacées"
    ((total+=1))

fi 
echo " "
sleep 1
nombre=$(ls *.mp4 *mkv 2>/dev/null | wc -l)
if [[ "$nombre" == 0 ]]; then
    echo "Vous n'avez aucune vidéo de disponible"

else
    mv *.mkv *.mp4 Videos/
    echo "Les vidéos ont bien été déplacées"
    ((total+=1))

fi

echo " "
sleep 1
if [[ "$total" != 0 ]]; then
    echo " Recyclage terminé"
else
    echo "Aucune tâche accomplie"
fi
echo " "
sleep 1
