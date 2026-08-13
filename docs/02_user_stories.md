# 2. Besoins fonctionnels — User Stories

## Acteurs

- **Visiteur** : utilisateur non authentifié.
- **Étudiant** : utilisateur principal authentifié.
- **Administrateur** : responsable de la gestion de la plateforme.

---

## MUST HAVE

### US01 — Visiteur : découvrir la plateforme
> En tant que visiteur, je veux consulter la présentation, les fonctionnalités et les offres de MedCoach afin de comprendre le service avant de m'inscrire.

### US02 — Visiteur : créer un compte
> En tant que visiteur, je veux créer un compte afin d'accéder aux fonctionnalités réservées aux étudiants.

### US03 — Visiteur : se connecter
> En tant que visiteur, je veux me connecter afin d'accéder à mon espace étudiant.

### US04 — Étudiant : gérer mon profil
> En tant qu'étudiant, je veux consulter et modifier mon profil afin de personnaliser mon utilisation de la plateforme.

### US05 — Étudiant : importer un cours
> En tant qu'étudiant, je veux importer mes supports de cours au format PDF afin que l'assistant puisse les exploiter pour mes révisions.

### US06 — Étudiant : poser une question
> En tant qu'étudiant, je veux poser une question en langage naturel afin d'obtenir une réponse basée sur les ressources disponibles.

### US07 — Étudiant : vérifier les sources
> En tant qu'étudiant, je veux connaître les documents utilisés pour répondre à ma question afin de pouvoir vérifier l'information.

### US08 — Étudiant : obtenir une explication
> En tant qu'étudiant, je veux demander une explication ou une reformulation d'une notion afin de mieux la comprendre.

### US09 — Étudiant : résumer un cours
> En tant qu'étudiant, je veux obtenir un résumé d'un contenu afin de faciliter ma révision.

### US10 — Étudiant : générer un quiz
> En tant qu'étudiant, je veux générer un quiz ou un QCM à partir d'un cours ou d'un thème afin de tester mes connaissances.

### US11 — Étudiant : corriger un quiz
> En tant qu'étudiant, je veux obtenir la correction, les explications et mon score afin d'identifier mes erreurs.

### US12 — Étudiant : suivre ma progression
> En tant qu'étudiant, je veux consulter mon historique et mes résultats afin de suivre mon évolution.

### US13 — Étudiant : identifier mes difficultés
> En tant qu'étudiant, je veux identifier les matières ou notions dans lesquelles mes résultats sont faibles afin de cibler mes révisions.

### US14 — Étudiant : recevoir des recommandations
> En tant qu'étudiant, je veux recevoir des suggestions de cours ou d'exercices en fonction de mes difficultés afin de mieux organiser mes révisions.

### US15 — Étudiant : utiliser le français ou l'anglais
> En tant qu'étudiant, je veux utiliser l'assistant en français ou en anglais afin d'étudier dans la langue qui me convient.

### US16 — Étudiant : modifier le thème
> En tant qu'étudiant, je veux modifier le thème de l'interface afin d'adapter l'apparence de l'application à mes préférences.

### US17 — Étudiant : gérer mes documents
> En tant qu'étudiant, je veux consulter et supprimer mes documents importés afin de garder mon espace organisé.

### US18 — Étudiant : souscrire au Premium
> En tant qu'étudiant, je veux souscrire à une offre Premium afin de bénéficier d'un accès étendu aux fonctionnalités de la plateforme.

### US19 — Administrateur : gérer les utilisateurs
> En tant qu'administrateur, je veux gérer les comptes utilisateurs afin de contrôler les accès à la plateforme.

### US20 — Administrateur : gérer les ressources
> En tant qu'administrateur, je veux ajouter, modifier, retirer et organiser les ressources pédagogiques afin de maintenir un corpus exploitable.

### US21 — Administrateur : gérer les matières
> En tant qu'administrateur, je veux gérer les matières et leurs contenus afin de maintenir une organisation cohérente des ressources.

### US22 — Administrateur : superviser les abonnements
> En tant qu'administrateur, je veux consulter les informations relatives aux abonnements afin de superviser l'accès aux offres.

---

## SHOULD HAVE

### US23 — Étudiant : reprendre une conversation
> En tant qu'étudiant, je veux consulter mon historique de conversations afin de reprendre une révision précédente.

### US24 — Étudiant : choisir le niveau du quiz
> En tant qu'étudiant, je veux choisir le niveau de difficulté d'un quiz afin d'adapter l'évaluation à mon niveau.

### US25 — Étudiant : consulter un tableau de bord
> En tant qu'étudiant, je veux visualiser mes scores et mes matières faibles sur un tableau de bord afin de suivre rapidement ma progression.

---

## Règles de gestion

- Un visiteur ne peut pas accéder aux fonctionnalités privées.
- Un étudiant ne peut accéder qu'à ses propres documents et données.
- Le Premium est un statut d'abonnement de l'étudiant et non un acteur.
- Les limites du compte gratuit et les droits Premium sont configurables.
- Le système doit privilégier les informations retrouvées dans le corpus documentaire.
- Si les ressources disponibles sont insuffisantes, le système doit le signaler au lieu de présenter une réponse comme certaine.
- Les documents personnels ne doivent pas être exposés aux autres étudiants.
