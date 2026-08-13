# 1. Analyse des besoins — MedCoach

## 1.1 Contexte

La formation médicale nécessite l'assimilation et la révision d'un volume important de connaissances provenant des cours, cahiers, polycopiés, ouvrages, anciennes épreuves et ressources numériques. La diversité et la dispersion de ces supports rendent parfois la recherche d'une information précise longue et difficile.

Les solutions numériques facilitent l'accès aux ressources, tandis que les assistants d'IA rendent le questionnement plus naturel. Cependant, une IA générative utilisée seule peut produire des réponses incorrectes, non contextualisées ou difficiles à vérifier. MedCoach propose donc un assistant basé sur le RAG afin de rechercher des informations dans des ressources documentaires avant de générer une réponse.

## 1.2 Problématique

Comment faciliter la recherche d'informations, la compréhension des cours et l'autoévaluation des étudiants en médecine au Cameroun, tout en fournissant des réponses contextualisées à partir de ressources pédagogiques identifiables ?

## 1.3 Objectif général

Concevoir et développer un assistant intelligent basé sur le RAG pour accompagner les étudiants en médecine dans leurs révisions et leur autoévaluation.

## 1.4 Objectifs spécifiques

- Permettre le questionnement en langage naturel.
- Permettre l'importation de cours PDF.
- Rechercher les passages pertinents dans les ressources disponibles.
- Générer des réponses contextualisées et, lorsque possible, référencées.
- Générer des résumés et explications.
- Générer des quiz et QCM.
- Corriger les évaluations et fournir un score.
- Suivre la progression et identifier les difficultés.
- Proposer des recommandations de révision.
- Prendre en charge le français et l'anglais.
- Permettre la personnalisation du thème.
- Gérer les accès gratuit et Premium.
- Assurer la sécurité et la confidentialité des données.

## 1.5 Justification du RAG

Le RAG (Retrieval-Augmented Generation) combine la recherche d'informations et la génération de texte. Le système récupère d'abord les informations pertinentes dans un corpus documentaire, puis les transmet au modèle de langage pour produire une réponse.

Dans MedCoach, le RAG est choisi parce que l'objectif n'est pas simplement de faire générer une réponse par une IA, mais de permettre à l'assistant de s'appuyer sur les ressources pédagogiques disponibles. Cela améliore la contextualisation et facilite la traçabilité des réponses.

Le RAG ne garantit toutefois pas à lui seul la vérité des informations. La qualité du corpus, la qualité de la récupération et la validation des contenus restent essentielles, particulièrement dans le domaine médical.

## 1.6 Périmètre

### Inclus

- Gestion des comptes et profils
- Assistant RAG
- Import et traitement des PDF
- Recherche sémantique
- Résumés et explications
- Quiz/QCM
- Correction et progression
- Recommandations
- Français/anglais
- Personnalisation du thème
- Gratuit/Premium
- Administration

### Hors périmètre

- Diagnostic médical
- Prescription ou décision thérapeutique
- Remplacement d'un professionnel de santé
- Application Android/iOS native
- Consultation médicale réelle

## 1.7 Acteurs

### Visiteur
Consulte la plateforme, ses fonctionnalités et ses offres, puis peut s'inscrire ou se connecter.

### Étudiant
Utilise les fonctionnalités de révision, importe ses cours, interroge l'assistant, réalise des quiz, consulte ses résultats et gère ses préférences.

### Administrateur
Gère les utilisateurs, les ressources, les matières, les paramètres et la supervision de la plateforme.

## 1.8 Règle importante

Le statut Premium n'est pas un acteur distinct : c'est un niveau d'abonnement de l'étudiant. Le RAG, le LLM, la base de données et le stockage sont des composants/services techniques, pas des utilisateurs.
