# 06 — Modules applicatifs

## 1. Module Authentification & Utilisateurs (`users`)
- Inscription, connexion, gestion de session (JWT).
- Gestion des rôles : étudiant, formateur, administrateur.
- Gestion de profil et préférences de révision.

## 2. Module Documents (`documents`)
- Upload et stockage des fichiers (PDF, DOCX).
- Extraction de texte et métadonnées.
- Organisation par matière/module/tag.
- Suivi du statut d'indexation (en attente, en cours, terminé, erreur).

## 3. Module RAG (`rag`)
- Chunking des documents (découpage en segments sémantiques).
- Génération d'embeddings vectoriels (modèle d'embedding dédié).
- Stockage et recherche par similarité via pgvector.
- Construction du contexte augmenté et appel au modèle de génération.
- Formatage des réponses avec citations des sources.

## 4. Module Quiz & Fiches (`assessment`)
- Génération automatique de questions à choix multiples à partir du corpus.
- Génération de fiches de synthèse structurées.
- Correction et scoring des quiz réalisés.

## 5. Module Progression (`progression`)
- Journalisation des interactions (questions posées, quiz réalisés, résultats).
- Calcul d'indicateurs de maîtrise par thème/module.
- Génération de recommandations de révision personnalisées.

## 6. Module Administration (`admin_panel`)
- Supervision des utilisateurs et des rôles.
- Supervision du pipeline d'ingestion (logs, erreurs, relances).
- Configuration des paramètres système (quotas, sécurité, rétention).

## 7. Module Frontend PWA
- **Auth** : écrans de connexion/inscription.
- **Bibliothèque** : gestion des documents importés.
- **Assistant** : interface conversationnelle de question-réponse.
- **Révision** : quiz et fiches générées.
- **Tableau de bord** : visualisation de la progression.
- **Service Worker** : gestion du cache et du mode hors-ligne.

## 8. Dépendances inter-modules
- `documents` → déclenche l'indexation via `rag`.
- `rag` → consommé par `assessment` (génération de quiz) et par l'interface conversationnelle.
- `progression` → consomme les événements générés par `assessment` et `rag`.
- `admin_panel` → supervise transversalement `users`, `documents` et `rag`.
