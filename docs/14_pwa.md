# 14 — Progressive Web App (PWA)

## 1. Objectif
Offrir une expérience applicative installable, réactive et partiellement disponible hors-ligne, à partir d'une base de code React/TypeScript unique.

## 2. Caractéristiques PWA implémentées
- **Manifest Web App** (`manifest.json`) définissant nom, icônes, couleurs de thème et mode d'affichage (`standalone`).
- **Service Worker** gérant la mise en cache des ressources statiques (JS, CSS, icônes) et de certaines données (dernières réponses consultées, quiz déjà générés).
- **Installabilité** sur desktop et mobile (Add to Home Screen).
- **Stratégie de cache** : cache-first pour les assets statiques, network-first avec fallback cache pour les données dynamiques (réponses RAG déjà obtenues).

## 3. Fonctionnalités disponibles hors-ligne
- Consultation des documents déjà synchronisés localement.
- Relecture des réponses RAG précédemment obtenues.
- Réalisation de quiz déjà téléchargés (avec synchronisation différée des résultats).

## 4. Fonctionnalités nécessitant une connexion
- Import de nouveaux documents.
- Nouvelles questions au moteur RAG (nécessitant un accès au backend et au modèle de génération).
- Génération de nouveaux quiz.

## 5. Architecture technique frontend
- **React + TypeScript** : structuration en composants réutilisables, typage strict des modèles de données (Document, Quiz, ProgressRecord, etc.).
- **Gestion d'état** : store centralisé (ex. Redux Toolkit ou Zustand) pour la synchronisation entre vues.
- **Service Worker** : généré via Workbox ou configuration manuelle, avec stratégie de mise à jour contrôlée (notification à l'utilisateur en cas de nouvelle version disponible).
- **Synchronisation différée** : file d'actions en attente (Background Sync API) pour renvoyer au backend les résultats de quiz réalisés hors-ligne.

## 6. Expérience utilisateur
- Indicateur visuel de l'état de connexion (en ligne / hors-ligne).
- Messages explicites lorsqu'une fonctionnalité nécessite une connexion réseau.
- Installation proposée via une bannière contextuelle après quelques visites.

## 7. Sécurité côté PWA
- Stockage local limité aux données non sensibles ou chiffrées (éviter le stockage de contenu médical sensible en clair dans le cache).
- Expiration automatique du cache de données dynamiques après une durée définie.
