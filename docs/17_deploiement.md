# 17 — Déploiement

## 1. Stratégie de conteneurisation
- Chaque composant applicatif est packagé sous forme d'image Docker : backend Django, frontend React (build statique servi via Nginx), base de données PostgreSQL + pgvector, broker de tâches (Redis) et worker Celery.
- Orchestration locale/dev via `docker-compose`.
- Orchestration en production envisageable via Kubernetes pour la scalabilité horizontale.

## 2. Architecture de déploiement (schéma simplifié)
```
                     ┌─────────────────────┐
                     │     Reverse Proxy     │  (Nginx / Traefik, TLS)
                     └──────────┬───────────┘
              ┌──────────────────┼──────────────────┐
              │                                     │
   ┌──────────▼───────────┐              ┌──────────▼───────────┐
   │  Frontend PWA (statique) │              │   Backend Django/DRF   │
   └───────────────────────┘              └──────────┬───────────┘
                                                       │
                                        ┌──────────────┼──────────────┐
                                        │                             │
                             ┌──────────▼───────────┐     ┌──────────▼───────────┐
                             │ PostgreSQL + pgvector  │     │  Worker Celery + Redis │
                             └───────────────────────┘     └───────────────────────┘
```

## 3. Environnements
- **Développement** : exécution locale via `docker-compose up`, rechargement à chaud du frontend et du backend.
- **Staging/Recette** : environnement conteneurisé reproduisant la configuration de production à échelle réduite, utilisé pour la validation avant mise en production.
- **Production** : déploiement conteneurisé avec scalabilité horizontale du backend (plusieurs réplicas) et sauvegardes automatisées de la base de données.

## 4. Étapes de déploiement type
1. Build des images Docker (backend, frontend, worker).
2. Exécution des migrations Django (`manage.py migrate`), incluant l'activation de l'extension `pgvector`.
3. Déploiement des conteneurs via l'orchestrateur choisi.
4. Vérification des health checks (endpoints `/health`) pour chaque service.
5. Bascule du trafic (rolling update) pour minimiser l'indisponibilité.

## 5. Intégration continue / déploiement continu (CI/CD)
- Pipeline CI : build, tests automatisés, analyse de qualité de code, build des images Docker.
- Pipeline CD : déploiement automatique en staging après succès de la CI ; déploiement en production après validation manuelle.

## 6. Supervision et observabilité
- Centralisation des logs applicatifs (backend, worker, base de données).
- Monitoring des métriques clés : temps de réponse API, taux d'erreur, charge des tâches d'ingestion, utilisation de la base de données.
- Alertes automatiques en cas de dépassement de seuils critiques (temps de réponse RAG, échecs d'ingestion).

## 7. Sauvegardes et reprise d'activité
- Sauvegardes régulières et automatisées de PostgreSQL (incluant les données vectorielles).
- Procédure de restauration documentée et testée périodiquement.
- Plan de reprise d'activité (RPO/RTO) défini selon les exigences du projet.
