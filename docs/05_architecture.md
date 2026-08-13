# 05 — Architecture générale

## 1. Vue d'ensemble
MedCoach suit une architecture en couches, séparant clairement le frontend (PWA React/TypeScript), le backend applicatif (Django/DRF) et la couche de données (PostgreSQL + pgvector), avec un pipeline RAG dédié au traitement documentaire et à la génération de réponses.

```
┌─────────────────────────┐
│   Frontend (React/TS)   │  PWA, Service Worker, Cache
└────────────┬─────────────┘
             │ HTTPS / REST-JSON
┌────────────▼─────────────┐
│  Backend Django (API)    │  Auth, Business Logic, Orchestration RAG
├───────────────────────────┤
│  Module RAG               │  Chunking, Embeddings, Retrieval, Prompting
├───────────────────────────┤
│  Pipeline d'ingestion      │  Parsing documents, OCR éventuel, indexation
└────────────┬─────────────┘
             │
┌────────────▼─────────────┐
│ PostgreSQL + pgvector     │  Données relationnelles + vecteurs d'embeddings
└───────────────────────────┘
```

## 2. Style architectural
- Architecture modulaire en couches (layered architecture) côté backend, organisée en applications Django indépendantes (users, documents, rag, progression).
- API REST comme contrat unique entre frontend et backend.
- Séparation claire entre logique métier et pipeline IA (le module RAG est isolé et testable indépendamment).

## 3. Composants principaux
- **Frontend PWA** : interface utilisateur, gestion du cache, expérience hors-ligne partielle.
- **API Backend** : authentification, gestion des ressources (documents, utilisateurs, quiz), orchestration des appels au module RAG.
- **Module RAG** : découpage des documents, génération d'embeddings, recherche vectorielle, construction du prompt augmenté, appel au modèle de génération.
- **Base de données** : stockage relationnel classique (utilisateurs, métadonnées) et stockage vectoriel (embeddings) via pgvector.
- **Stockage de fichiers** : stockage des documents bruts (système de fichiers ou object storage compatible S3).

## 4. Communication entre composants
- Frontend ↔ Backend : API REST sécurisée (JWT), format JSON.
- Backend ↔ Base de données : ORM Django, requêtes vectorielles via pgvector.
- Backend ↔ Module RAG : appel interne (synchrone pour les requêtes courtes, asynchrone via file de tâches pour l'ingestion de documents volumineux).

## 5. Traitement asynchrone
- Utilisation d'une file de tâches (ex. Celery + broker Redis) pour l'ingestion et la vectorisation de documents volumineux, afin de ne pas bloquer les requêtes utilisateur.

## 6. Environnements
- **Développement** : docker-compose local (backend, frontend, PostgreSQL, broker).
- **Recette/Staging** : environnement conteneurisé reproduisant la production à échelle réduite.
- **Production** : déploiement conteneurisé avec scalabilité horizontale du backend et de la base de données.
