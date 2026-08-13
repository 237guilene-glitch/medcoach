# 07 — Acteurs du système

## 1. Étudiant
**Description** : utilisateur principal de la plateforme, en préparation d'examens médicaux.
**Interactions** :
- Importe ses documents de cours.
- Pose des questions au système RAG.
- Réalise des quiz et consulte des fiches de révision.
- Consulte son tableau de bord de progression.

## 2. Formateur / Tuteur
**Description** : encadrant pédagogique pouvant mettre à disposition du contenu validé et suivre la progression des étudiants.
**Interactions** :
- Met à disposition des corpus de référence.
- Suit la progression collective d'un groupe.
- Valide/corrige certaines réponses générées.

## 3. Administrateur système
**Description** : responsable de la configuration, de la sécurité et de la supervision technique de la plateforme.
**Interactions** :
- Gère les comptes et rôles.
- Supervise le pipeline d'ingestion documentaire.
- Configure les paramètres de sécurité et de rétention des données.

## 4. Système RAG (acteur non-humain)
**Description** : composant automatisé orchestrant la vectorisation, la recherche sémantique et la génération de réponses.
**Interactions** :
- Vectorise automatiquement les documents importés.
- Répond aux requêtes utilisateurs avec citation des sources.
- Génère quiz et fiches de synthèse.

## 5. Service d'authentification (acteur externe/technique)
**Description** : sous-système gérant l'émission et la validation des jetons de session (JWT).
**Interactions** :
- Valide les identifiants lors de la connexion.
- Émet et rafraîchit les jetons d'accès.

## 6. Matrice acteurs / fonctionnalités principales
| Acteur | Import documents | Q&A RAG | Quiz | Suivi progression | Administration |
|---|---|---|---|---|---|
| Étudiant | ✔ | ✔ | ✔ | ✔ | ✘ |
| Formateur | ✔ (référence) | ✔ | ✔ (validation) | ✔ (collectif) | ✘ |
| Administrateur | ✘ | ✘ | ✘ | ✘ | ✔ |
| Système RAG | ✔ (traitement) | ✔ (génération) | ✔ (génération) | ✘ | ✘ |
