# 08 — Cas d'utilisation

## UC-01 : Importer un document
**Acteur principal** : Étudiant
**Préconditions** : l'utilisateur est authentifié.
**Scénario nominal** :
1. L'utilisateur sélectionne un fichier PDF/DOCX à importer.
2. Le système valide le format et la taille du fichier.
3. Le fichier est stocké et une tâche d'indexation est déclenchée.
4. Le système confirme la réception et affiche le statut "en cours d'indexation".
**Extensions** : format non supporté → message d'erreur ; fichier trop volumineux → rejet avec message explicite.

## UC-02 : Poser une question (RAG)
**Acteur principal** : Étudiant
**Préconditions** : au moins un document indexé est disponible.
**Scénario nominal** :
1. L'utilisateur saisit une question en langage naturel.
2. Le système recherche les passages les plus pertinents par similarité vectorielle.
3. Le système génère une réponse augmentée par le contexte récupéré.
4. La réponse est affichée avec citation des sources utilisées.
**Extensions** : aucun passage pertinent trouvé → le système informe l'utilisateur de l'absence de réponse fiable.

## UC-03 : Générer un quiz
**Acteur principal** : Étudiant
**Préconditions** : un module/chapitre indexé est sélectionné.
**Scénario nominal** :
1. L'utilisateur choisit un chapitre et demande un quiz.
2. Le système génère un ensemble de questions à choix multiples à partir du corpus.
3. L'utilisateur répond aux questions.
4. Le système corrige et affiche le score ainsi que les explications.

## UC-04 : Consulter le tableau de bord de progression
**Acteur principal** : Étudiant
**Scénario nominal** :
1. L'utilisateur accède à son tableau de bord.
2. Le système agrège les résultats de quiz et l'historique des interactions.
3. Le système affiche les thèmes maîtrisés et les points à retravailler.

## UC-05 : Superviser le pipeline d'ingestion
**Acteur principal** : Administrateur
**Scénario nominal** :
1. L'administrateur consulte le tableau de supervision.
2. Le système affiche l'état des tâches d'ingestion (succès, en cours, erreurs).
3. L'administrateur peut relancer une tâche en erreur.

## UC-06 : Mettre à disposition un corpus de référence
**Acteur principal** : Formateur
**Scénario nominal** :
1. Le formateur importe un ensemble de documents validés.
2. Le formateur les associe à un groupe d'étudiants.
3. Les documents deviennent accessibles en lecture pour la recherche RAG des étudiants du groupe.

## Diagramme de cas d'utilisation (représentation textuelle)
```
Étudiant ── (Importer un document)
Étudiant ── (Poser une question)
Étudiant ── (Générer un quiz)
Étudiant ── (Consulter progression)
Formateur ── (Mettre à disposition un corpus)
Formateur ── (Suivre progression collective)
Administrateur ── (Superviser ingestion)
Administrateur ── (Gérer comptes/rôles)
```
