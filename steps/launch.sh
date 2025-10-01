#!/usr/bin/env bash

# --- Définition des options et des scripts associés ---
options=(
    "Checklist"
    "Check versions"
    "Installation de Kyverno"
    "Démo 1ère policy"
    "Démo Kyverno policies chart"
    "Démo Kyverno test"
    "Démo Générations"
    "Démo Mutations"
    "Quitter"
)

actions=(
    "./checklist.sh"
    "./checkversion.sh"
    "./1-install-kyverno.sh"
    "./2-first-policy.sh"
    "./6-kyverno-policies.sh"
    "./5-kyverno-test.sh"     
    "./4-generate.sh"        
    "./3-mutate.sh"
    "exit 0"
)

# --- Variables pour la navigation ---
selection_actuelle=0
nombre_options=${#options[@]}

# --- Fonction pour afficher le menu ---
function afficher_menu() {
    clear
    echo -e "=== Démo \033[38;5;205mKyverno \033[92mVolcamp\033[0m 2025 ==="
    echo ""

    for i in "${!options[@]}"; do
        # On utilise printf pour une meilleure portabilité
        if [ "$i" -eq "$selection_actuelle" ]; then
            # %s est un placeholder pour la chaîne de caractères, \n pour le saut de ligne
            printf " > \e[7m %s \e[0m\n" "${options[$i]}"
        else
            printf "   %s\n" "${options[$i]}"
        fi
    done
    echo "--------------------"
}

# --- Boucle principale du menu ---
while true; do
    afficher_menu

    # Lecture d'une seule touche
    read -rsn1 touche

    # Détection de la touche Entrée
    if [[ -z "$touche" ]]; then
        action=${actions[$selection_actuelle]}
        clear
        if [[ "$action" == "exit 0" ]]; then
            echo "Au revoir !"
            break
        else
            echo "Exécution de : $action"
            echo "----------------------------"
            bash "$action"
            echo "----------------------------"
            echo "Appuyez sur n'importe quelle touche pour retourner au menu..."
            read -rsn1
        fi
    fi

    # Détection des flèches (séquence d'échappement)
    if [[ "$touche" == $'\x1b' ]]; then
        read -rsn2 -t 1 reste_touche 
        case "$reste_touche" in
            '[A') # Flèche HAUT
                selection_actuelle=$(( (selection_actuelle - 1 + nombre_options) % nombre_options ))
                ;;
            '[B') # Flèche BAS
                selection_actuelle=$(( (selection_actuelle + 1) % nombre_options ))
                ;;
        esac
    fi
done

