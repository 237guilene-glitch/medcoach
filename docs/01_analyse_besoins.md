# 01 — Analyse des besoins

## 1. Contexte du projet
MedCoach est une plateforme d'accompagnement à la préparation aux examens médicaux, s'appuyant sur une architecture RAG (Retrieval-Augmented Generation) pour offrir un tutorat personnalisé basé sur des documents de cours, des annales et des références médicales validées.

## 2. Objectifs du projet
- Permettre aux étudiants en médecine de réviser efficacement à partir de leurs propres supports de cours.
- Générer des réponses fiables et sourcées à partir d'un corpus documentaire vérifié.
- Proposer un suivi de progression personnalisé (points faibles, thèmes à réviser).
- Offrir une expérience utilisable hors-ligne partiellement via une PWA.

## 3. Besoins fonctionnels
- Import de documents (PDF, DOCX, notes de cours) par l'utilisateur ou l'administrateur.
- Indexation vectorielle du contenu pour la recherche sémantique.
- Interface de question-réponse conversationnelle avec citation des sources.
- Génération de quiz et de fiches de révision à partir du corpus.
- Tableau de bord de suivi des performances.
- Gestion des comptes utilisateurs (étudiants, formateurs, administrateurs).

## 4. Besoins non fonctionnels
- Temps de réponse acceptable (< 3 secondes pour une requête RAG standard).
- Sécurité et confidentialité des données médicales/académiques.
- Scalabilité horizontale du backend.
- Disponibilité en mode PWA installable sur mobile et desktop.
- Conformité aux bonnes pratiques RGPD pour les données personnelles.

## 5. Contraintes
- Stack imposée : Python/Django, PostgreSQL avec extension pgvector, React/TypeScript en PWA.
- Hébergement compatible avec un déploiement conteneurisé (Docker).
- Budget et délai limités à un cycle de développement académique/projet pilote.

## 6. Parties prenantes
- Étudiants en médecine (utilisateurs finaux).
- Formateurs/tuteurs (validation du contenu, suivi pédagogique).
- Équipe de développement.
- Administrateur système (déploiement, maintenance).

## 7. Livrables attendus
- Application web PWA fonctionnelle.
- Documentation technique et fonctionnelle complète.
- Pipeline d'ingestion de documents opérationnel.
- Jeu de tests couvrant les fonctionnalités critiques.
