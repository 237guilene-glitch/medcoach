# 4. Besoins non fonctionnels — MedCoach

## Performance
Les opérations de recherche et de génération doivent être exécutées dans un délai raisonnable. Le traitement asynchrone doit être envisagé pour les tâches longues, notamment l'ingestion de documents.

## Sécurité
Les accès doivent être protégés par authentification et autorisation. Les données et documents doivent être protégés contre les accès non autorisés.

## Confidentialité
Les documents personnels, conversations et données d'un étudiant doivent rester privés.

## Fiabilité
Le système doit distinguer une réponse fondée sur le corpus d'une information non disponible. Il ne doit pas présenter comme certaine une information qui ne peut pas être soutenue par les ressources disponibles.

## Traçabilité
Les réponses RAG doivent pouvoir être associées aux documents ou passages récupérés lorsque les références sont disponibles.

## Ergonomie
L'interface doit être simple, responsive et utilisable sur ordinateur et smartphone.

## Disponibilité
Le service doit être disponible dans les conditions prévues et les données importantes doivent être sauvegardées.

## Maintenabilité
Le code doit être modulaire, documenté et testable.

## Évolutivité
L'architecture doit pouvoir supporter l'ajout de nouvelles matières, documents, types de quiz et services IA.

## Compatibilité
L'application doit fonctionner sur les navigateurs modernes et permettre une installation PWA sur les appareils compatibles.

## Multilinguisme
Les fonctionnalités principales doivent supporter le français et l'anglais de manière cohérente.

## Confidentialité du corpus
Les documents personnels d'un étudiant ne doivent pas être mélangés avec ceux d'un autre étudiant lors de la récupération RAG.
