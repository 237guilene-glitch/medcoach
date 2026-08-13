# 15 — Sécurité

## 1. Authentification et autorisation
- Authentification par JWT (access token de courte durée + refresh token).
- Hachage des mots de passe avec un algorithme robuste (Argon2 ou PBKDF2 via Django).
- Contrôle d'accès basé sur les rôles (RBAC) : étudiant, formateur, administrateur.
- Vérification systématique des permissions au niveau de chaque endpoint de l'API (Django REST Framework permissions).

## 2. Protection des données
- Chiffrement des communications via TLS (HTTPS obligatoire en production).
- Chiffrement au repos des données sensibles (documents utilisateurs) si hébergées sur un stockage tiers.
- Isolation des documents par utilisateur : un étudiant ne peut interroger que son propre corpus (sauf corpus partagé explicitement par un formateur).

## 3. Sécurité applicative
- Protection contre les injections SQL via l'ORM Django (requêtes paramétrées).
- Validation stricte des entrées utilisateur (types de fichiers autorisés, taille maximale).
- Protection CSRF pour les vues nécessitant une session, et gestion CORS restrictive pour l'API.
- Limitation du taux de requêtes (rate limiting) sur les endpoints sensibles (authentification, requêtes RAG).

## 4. Sécurité du pipeline RAG
- Filtrage des contenus générés pour éviter la divulgation d'informations hors du corpus autorisé.
- Traçabilité systématique des sources citées, permettant un audit des réponses générées.
- Sandbox/isolation du traitement des fichiers importés (scan antivirus recommandé avant indexation).

## 5. Conformité RGPD
- Recueil du consentement explicite lors de l'inscription.
- Droit d'accès, de rectification et de suppression des données personnelles.
- Export des données personnelles sur demande de l'utilisateur.
- Politique de rétention définie pour les documents et les journaux d'interaction.

## 6. Journalisation et audit
- Journalisation des actions sensibles (connexion, suppression de documents, changements de rôle).
- Conservation des logs pendant une durée définie, avec anonymisation progressive.
- Alertes automatiques en cas de comportement suspect (tentatives de connexion répétées, accès anormaux).

## 7. Gestion des secrets
- Utilisation de variables d'environnement ou d'un gestionnaire de secrets (Vault, variables Docker/CI sécurisées) pour les clés API et identifiants de base de données.
- Aucune clé sensible ne doit être présente dans le code source versionné.
