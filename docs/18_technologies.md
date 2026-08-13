# 18 — Technologies utilisées

## 1. Backend
- **Python** : langage principal du backend.
- **Django** : framework web principal (structuration en applications, ORM, administration intégrée).
- **Django REST Framework (DRF)** : construction de l'API REST, sérialisation, gestion des permissions.
- **Celery** : traitement asynchrone (ingestion et vectorisation des documents).
- **Redis** : broker de messages pour Celery, éventuellement cache applicatif.

## 2. Base de données
- **PostgreSQL** : système de gestion de base de données relationnelle principal.
- **pgvector** : extension PostgreSQL permettant le stockage et la recherche par similarité de vecteurs d'embeddings.

## 3. Frontend
- **React** : bibliothèque de construction de l'interface utilisateur.
- **TypeScript** : typage statique pour la robustesse du code frontend.
- **PWA (Progressive Web App)** : manifest, service worker, stratégie de cache pour l'installabilité et le mode hors-ligne.
- **Gestion d'état** : Redux Toolkit ou Zustand (selon choix d'implémentation).

## 4. Intelligence artificielle / RAG
- **Modèle d'embedding** : génération de représentations vectorielles des chunks de documents et des requêtes utilisateurs.
- **Modèle de génération (LLM)** : génération des réponses augmentées à partir du contexte récupéré.
- **Pipeline RAG interne** : chunking, recherche vectorielle, construction de prompt, post-traitement des citations.

## 5. Infrastructure et déploiement
- **Docker / docker-compose** : conteneurisation des services pour le développement et la production.
- **Kubernetes (optionnel, production à grande échelle)** : orchestration et scalabilité horizontale.
- **Nginx / Traefik** : reverse proxy, terminaison TLS, service des assets statiques du frontend.

## 6. Qualité, tests et CI/CD
- **Pytest / Django TestCase** : tests unitaires et d'intégration backend.
- **Jest / React Testing Library** : tests unitaires frontend.
- **Playwright ou Cypress** : tests end-to-end.
- **Pipeline CI/CD** (ex. GitHub Actions/GitLab CI) : build, tests, analyse qualité, déploiement automatisé.

## 7. Sécurité
- **JWT (JSON Web Tokens)** : authentification et gestion de session.
- **TLS/HTTPS** : chiffrement des communications.
- **Argon2 / PBKDF2** : hachage sécurisé des mots de passe.

## 8. Justification des choix technologiques
- Django/DRF offre un écosystème mature pour une API robuste et sécurisée, avec un ORM facilitant l'intégration de pgvector.
- pgvector permet de conserver une architecture de données unifiée (relationnel + vectoriel) sans dépendre d'une base vectorielle tierce distincte.
- React/TypeScript en PWA garantit une expérience utilisateur moderne, installable et partiellement disponible hors-ligne, essentielle pour un usage de révision mobile.
