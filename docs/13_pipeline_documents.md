# 13 — Pipeline de traitement des documents

## 1. Objectif
Décrire le cycle de vie complet d'un document, depuis son import jusqu'à sa disponibilité pour la recherche RAG.

## 2. Étapes du pipeline

### Étape 1 : Réception
- Upload du fichier via l'API (`POST /documents`).
- Validation du format (PDF, DOCX) et de la taille maximale autorisée.
- Enregistrement des métadonnées en base avec statut `pending`.

### Étape 2 : Mise en file d'attente
- Une tâche asynchrone est créée (via Celery ou équivalent) pour ne pas bloquer la réponse à l'utilisateur.
- Statut du document mis à jour à `processing`.

### Étape 3 : Extraction du contenu
- Parsing du fichier pour extraire le texte structuré (titres, paragraphes, tableaux si possible).
- Recours à l'OCR pour les documents scannés ou images intégrées, si nécessaire.

### Étape 4 : Nettoyage et normalisation
- Suppression des artefacts de mise en page (en-têtes/pieds de page répétitifs, numéros de page).
- Normalisation de l'encodage et de la ponctuation.

### Étape 5 : Chunking
- Découpage du texte en segments cohérents, avec chevauchement pour préserver le contexte inter-segments.
- Conservation des métadonnées de position (page, section).

### Étape 6 : Vectorisation
- Génération d'un embedding pour chaque chunk.
- Insertion des vecteurs dans la table `documents_chunk` (pgvector).

### Étape 7 : Finalisation
- Mise à jour du statut du document à `indexed`.
- Notification de l'utilisateur (via l'interface ou webhook interne) que le document est disponible pour interrogation.

### Étape 8 : Gestion des erreurs
- En cas d'échec à une étape (extraction, vectorisation), le statut passe à `error` avec un message de diagnostic.
- Possibilité de relance manuelle de la tâche par l'administrateur ou automatique (retry avec backoff).

## 3. Schéma simplifié
```
[Upload] → [pending] → [processing] → [extraction] → [chunking] → [embeddings] → [indexed]
                                                                              └──► [error] (si échec)
```

## 4. Points de supervision
- Tableau de bord administrateur listant les documents par statut.
- Alertes en cas d'accumulation de tâches en erreur.
- Journalisation détaillée de chaque étape pour le débogage.

## 5. Contraintes de performance
- Traitement asynchrone obligatoire pour tout document dépassant un seuil de taille (ex. 5 Mo).
- Limitation du nombre de tâches concurrentes pour éviter la saturation des ressources de calcul liées à la génération d'embeddings.
