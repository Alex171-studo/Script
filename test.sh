#!/bin/bash
echo " " 
echo "Bienvenue dans votre gestionnaire d'espace"
echo "================================================================"
read -rp " Quel est votre répertoire cible (en chemin absolue): " target
read -rp " Combien de lignes voulez-vous afficher: " nombre_result
read -rp " Quel méthode de tri voulez-vous utilisé (nom/taille) : " tri
read -rp " Quel mot-clé voulez-vous utliser pour filtrer les résultats : " filtre



affiche_result(){
    case $tri in 
        taille)
            du -hs "$target"/* | sort -rh | head -n "$nombre_result";;
        nom) 
        du -hs "$target"/* | sort -k2 | head -n "$nombre_result";;
        *)
            echo "Option de tri invalide"
            ;;
    esac
}

filtrer_resultats(){
if [ -n "$filtre" ];then
    grep -i "$filtre"
else
    cat
fi
}

affiche_arborescence(){
    tree -h --du "$target"
}
echo " "
affiche_result | filtrer_resultats | while read -r ligne; do
    echo "$ligne"
    done

echo " "

affiche_arborescence
echo ""
