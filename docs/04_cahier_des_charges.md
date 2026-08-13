# 04 — Cahier des charges

## 1. Présentation du projet
MedCoach est une application web progressive (PWA) d'aide à la révision médicale, combinant un moteur RAG (Retrieval-Augmented Generation) et une interface conversationnelle, développée avec la stack Python/Django, PostgreSQL + pgvector et React/TypeScript.

## 2. Périmètre fonctionnel
### Inclus (V1)
- Import et gestion de documents personnels.
- Recherche sémantique et question-réponse sourcée.
- Génération de quiz et fiches de révision.
- Suivi de progression individuel.
- Authentification et gestion des rôles (étudiant, formateur, admin).
- Mode PWA installable avec cache partiel hors-ligne.

### Exclus (hors V1)
- Application mobile native (iOS/Android hors PWA).
- Correction automatique d'examens officiels.
- Intégration à des dossiers médicaux patients réels.

## 3. Exigences fonctionnelles détaillées
- EF-01 : Le système doit permettre l'upload de fichiers PDF/DOCX de taille maximale définie (ex. 50 Mo).
- EF-02 : Le système doit extraire, découper (chunking) et vectoriser le contenu des documents.
- EF-03 : Le système doit permettre une recherche par similarité vectorielle sur le corpus de l'utilisateur.
- EF-04 : Le système doit générer des réponses avec citation explicite des passages sources.
- EF-05 : Le système doit permettre la génération de quiz à choix multiples à partir d'un chapitre.
- EF-06 : Le système doit fournir un tableau de bord de suivi de progression.

## 4. Exigences non fonctionnelles
- ENF-01 : Temps de réponse moyen inférieur à 3 secondes pour une requête RAG.
- ENF-02 : Disponibilité cible de 99% en environnement de production.
- ENF-03 : Chiffrement des données sensibles au repos et en transit (TLS).
- ENF-04 : Conformité RGPD (droit à l'oubli, export des données).
- ENF-05 : Architecture modulaire permettant l'évolution vers d'autres domaines que le médical.

## 5. Stack technique retenue
- **Backend** : Python, Django, Django REST Framework.
- **Base de données** : PostgreSQL avec extension pgvector pour la recherche vectorielle.
- **Frontend** : React, TypeScript, architecture PWA (service workers, manifest).
- **IA / RAG** : pipeline d'embeddings + génération augmentée par récupération.
- **Déploiement** : conteneurisation Docker, orchestration via docker-compose (ou Kubernetes en production).

## 6. Planning indicatif
| Phase | Durée estimée |
|---|---|
| Cadrage et conception | 2 semaines |
| Développement backend & pipeline RAG | 4 semaines |
| Développement frontend PWA | 3 semaines |
| Tests et intégration | 2 semaines |
| Déploiement et recette | 1 semaine |

## 7. Critères d'acceptation
- Toutes les user stories prioritaires (US-01 à US-07) sont fonctionnelles.
- Les réponses générées comportent systématiquement une source vérifiable.
- L'application est installable en PWA et fonctionne partiellement hors-ligne.
- Les tests automatisés couvrent au minimum les parcours critiques (import, question-réponse, quiz).
