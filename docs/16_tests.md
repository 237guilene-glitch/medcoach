# 16 — Stratégie de tests

## 1. Niveaux de tests

### Tests unitaires
- Backend : couverture des modèles Django, des sérialiseurs et des fonctions du module RAG (chunking, calcul de similarité, construction de prompt).
- Frontend : couverture des composants React critiques (formulaires, affichage des réponses, gestion d'état) via Jest et React Testing Library.

### Tests d'intégration
- Vérification des endpoints API (authentification, upload de documents, requêtes RAG, génération de quiz) avec base de données de test.
- Vérification de l'intégration entre le module RAG et PostgreSQL/pgvector (recherche vectorielle).

### Tests end-to-end (E2E)
- Parcours utilisateur complet : inscription → import de document → question-réponse → génération de quiz → consultation du tableau de bord.
- Outils envisagés : Playwright ou Cypress pour l'automatisation des scénarios E2E.

### Tests de performance
- Mesure du temps de réponse des requêtes RAG sous charge (objectif < 3 secondes).
- Tests de montée en charge sur l'ingestion de documents volumineux.

### Tests de sécurité
- Vérification des contrôles d'accès par rôle (aucun accès croisé entre corpus utilisateurs).
- Tests de robustesse face à des fichiers malformés ou malveillants.

## 2. Environnements de test
- Environnement isolé avec base PostgreSQL de test dédiée (extension pgvector activée).
- Jeux de données de test représentatifs (documents médicaux fictifs, anonymisés).

## 3. Critères de couverture
- Couverture de code cible : au minimum 70% sur les modules critiques (RAG, gestion documentaire, authentification).
- Priorité sur les tests des parcours utilisateurs identifiés comme critiques (US-01, US-02, US-03).

## 4. Intégration continue
- Exécution automatique des tests unitaires et d'intégration à chaque pull request (pipeline CI).
- Blocage du merge en cas d'échec des tests ou de régression de couverture significative.

## 5. Recette fonctionnelle
- Validation manuelle des scénarios critiques par l'équipe projet avant chaque mise en production.
- Vérification qualitative des réponses générées par le module RAG (pertinence, exactitude des citations).
