# **Calculatrice Flutter**

Ce projet est une simple calculatrice développée avec **Flutter**. Elle permet d’effectuer les opérations de base : addition, soustraction, multiplication, division, et propose également un bouton de réinitialisation (**C**) et un bouton pour effacer le dernier caractère (**⌫**) en option.

---

## **Fonctionnalités**
- **Opérations de base** : +, -, *, /
- **Saisie des chiffres** : 0 à 9 (incluant un éventuel point décimal)
- **Bouton "C"** : réinitialisation complète de la saisie et du résultat
- **Bouton "="** : évaluation de l’expression saisie
- **Affichage du résultat** : conversion automatique si le résultat est un entier (ex. 4.0 → 4)
- **Design simple et épuré** : utilisation de `GridView` pour afficher les boutons de manière propre

---

# Choix Techniques

## 1. Framework & Langage  
- Utilisation de **Flutter** pour son efficacité dans le développement d’interfaces fluides et responsives.  
- **Dart** comme langage de programmation, bien adapté à la réactivité et à la gestion d’état.  

## 2. Architecture  
- **StatefulWidget** pour gérer dynamiquement l'affichage et l'état de la calculatrice.  
- **setState()** utilisé pour mettre à jour l'affichage en fonction des entrées utilisateur.  

## 3. Gestion des Opérations  
- Stockage de l’expression mathématique sous forme de chaîne de caractères.  
- **Package `math_expressions`** pour évaluer l’expression et éviter d’écrire un parseur manuel.  

---

# Difficultés rencontrées et solutions  

## 1. Gestion de l'affichage dynamique  
- **Problème :** Lors de la saisie des chiffres et opérations, l’écran ne se mettait pas à jour correctement.  
- **Solution :** Ajout d’un `setState()` après chaque mise à jour de l’expression pour forcer la reconstruction du widget.  

## 2. Évaluation des expressions mathématiques  
- **Problème :** Le calcul avec `eval()` sur une chaîne entraînait des erreurs de syntaxe.  
- **Solution :** Utilisation de **`math_expressions`**, qui convertit la chaîne en arbre d’expressions mathématiques avant l’évaluation.  

## 3. Disposition des boutons  
- **Problème :** L’interface n’était pas bien adaptée à différentes tailles d’écran.  
- **Solution :** Utilisation de **`Flexible` & `GridView.builder`** pour que la disposition des boutons s’adapte dynamiquement.

---

## **Installation et Lancement**

### **1. Cloner ou Télécharger le Projet**
- **Option A** : Cloner avec Git
  ```bash
  git clone https://github.com/votre-compte/github-flutter-calculator.git
  cd github-flutter-calculator

## **Copie du projet**

![image](https://github.com/user-attachments/assets/dde2de31-e7a6-4be4-a9e2-51efb66d6736)
