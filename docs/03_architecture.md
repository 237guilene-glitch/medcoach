# 3. Architecture du système — MedCoach

## 3.1 Vue générale

MedCoach est une application web conçue avec une stack principalement Python/Django. L'application est proposée sous forme de **Progressive Web App (PWA)** afin d'être accessible depuis un navigateur et installable sur l'écran d'accueil d'un téléphone sous forme d'icône.

La PWA n'est pas une application Android native. L'interface est servie par l'application web et l'utilisateur peut y accéder depuis Chrome ou un autre navigateur compatible. Le serveur Django reste responsable des traitements métier et des données.

## 3.2 Architecture logique

```text
Utilisateur
    |
    v
PWA / Interface Web
    |
    v
Django / API / Logique métier
    |
    +-------------------+-------------------+
    |                   |                   |
    v                   v                   v
Gestion utilisateurs  Documents         Quiz/Progression
    |                   |
    |                   v
    |             Pipeline RAG
    |                   |
    |        +----------+----------+
    |        |                     |
    |        v                     v
    |   Recherche vectorielle     LLM
    |        |                     |
    |        +----------+----------+
    |                   |
    +-------------------v
                 Réponse à l'étudiant
```

## 3.3 Modules applicatifs

### Gestion des utilisateurs
Comptes, authentification, profils, rôles et préférences.

### Gestion documentaire
Import, consultation, suppression et organisation des documents.

### Pipeline RAG
Extraction du texte, nettoyage, découpage en passages, création des représentations vectorielles, indexation et récupération des passages pertinents.

### Assistant intelligent
Analyse de la question, récupération du contexte, génération de la réponse et affichage des références.

### Révision
Résumés, explications, reformulations et recherche dans les ressources.

### Autoévaluation
Génération de QCM/quiz, réponses, correction, score et explications.

### Progression
Historique, résultats, matières faibles et recommandations.

### Multilingue
Gestion du français et de l'anglais pour l'interface et les interactions.

### Personnalisation
Préférences utilisateur et thème de l'interface.

### Abonnements
Gestion des limites du mode gratuit et des droits du mode Premium.

### Administration
Gestion des utilisateurs, matières, ressources et paramètres de supervision.

## 3.4 Architecture RAG

Le fonctionnement principal du RAG suit le flux :

```text
PDF / Corpus documentaire
        |
        v
Extraction du texte
        |
        v
Nettoyage et découpage
        |
        v
Embeddings
        |
        v
Index vectoriel
        |
        v
Question de l'étudiant
        |
        v
Recherche sémantique
        |
        v
Passages pertinents
        |
        v
LLM + contexte récupéré
        |
        v
Réponse + références
```

Le RAG permet donc de séparer deux opérations : **retrouver l'information** puis **générer la réponse**.

## 3.5 Gestion des PDF

Lorsqu'un étudiant importe un PDF, le système vérifie le fichier, extrait son contenu, le nettoie et le découpe en passages exploitables. Les passages sont ensuite indexés afin de pouvoir être retrouvés lors d'une question.

Les documents personnels restent associés à leur propriétaire et ne doivent pas être accessibles aux autres étudiants.

## 3.6 PWA

La PWA fournit une expérience proche d'une application mobile :

- installation sur l'écran d'accueil ;
- icône dédiée ;
- interface responsive ;
- ouverture dans un mode adapté au mobile ;
- mise en cache de certaines ressources lorsque cela est pertinent.

La PWA ne signifie pas que l'assistant fonctionne entièrement hors ligne. Les fonctionnalités RAG et LLM dépendent du serveur et/ou des services d'IA utilisés, sauf si un modèle local est explicitement prévu.

## 3.7 Sécurité

La sécurité doit notamment couvrir :

- authentification et autorisation ;
- contrôle d'accès par rôle ;
- protection des données personnelles ;
- isolation des documents personnels ;
- validation des fichiers importés ;
- communications HTTPS ;
- protection des API ;
- sauvegardes des données importantes.

## 3.8 Principe d'architecture

Le système doit privilégier une séparation claire entre :

- présentation ;
- API et logique métier ;
- gestion documentaire ;
- pipeline RAG ;
- génération IA ;
- persistance des données.

Cette séparation facilite la maintenance, les tests et l'évolution du système.
