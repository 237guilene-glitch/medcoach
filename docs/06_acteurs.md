# 6. Acteurs du système

## Visiteur

Le visiteur est un utilisateur non authentifié. Il peut découvrir MedCoach, consulter ses fonctionnalités, prendre connaissance des offres et accéder à l'inscription ou à la connexion.

## Étudiant

L'étudiant est l'utilisateur principal. Il peut gérer son profil, importer ses cours, interroger l'assistant RAG, consulter les sources, demander des résumés et explications, générer des quiz, consulter ses corrections, suivre sa progression, recevoir des recommandations, choisir le français ou l'anglais et personnaliser le thème.

Le statut Premium est un niveau d'abonnement de l'étudiant et ne constitue pas un acteur distinct.

## Administrateur

L'administrateur supervise la plateforme. Il gère les comptes, les ressources, les matières, les paramètres et les informations nécessaires au suivi des abonnements.

## Remarque UML

Le RAG, le modèle de langage, la base de données et le stockage sont des composants ou services techniques. Ils ne sont pas des acteurs humains du système. Un service externe de paiement peut être représenté comme acteur secondaire dans un diagramme de cas d'utilisation si le paiement est inclus dans le périmètre.
