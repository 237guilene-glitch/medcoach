# 12 — Architecture RAG (Retrieval-Augmented Generation)

## 1. Vue d'ensemble du pipeline RAG
```
Document ──► Extraction texte ──► Chunking ──► Embeddings ──► Stockage vectoriel (pgvector)
                                                                        │
Question utilisateur ──► Embedding requête ──► Recherche similarité ◄──┘
                                                        │
                                            Contexte récupéré (top-k chunks)
                                                        │
                                        Construction du prompt augmenté
                                                        │
                                            Appel au modèle de génération
                                                        │
                                        Réponse finale + citations sources
```

## 2. Étape 1 : Extraction et chunking
- Extraction du texte brut à partir des PDF/DOCX (parsing structuré, conservation des titres de section).
- Découpage en segments (chunks) de taille contrôlée (ex. 300 à 500 tokens) avec chevauchement (overlap) pour préserver le contexte.
- Conservation des métadonnées (document source, numéro de page, section) pour la traçabilité.

## 3. Étape 2 : Génération d'embeddings
- Chaque chunk est transformé en vecteur numérique via un modèle d'embedding dédié.
- Les vecteurs sont stockés dans la table `documents_chunk` (colonne `embedding` de type `vector`).

## 4. Étape 3 : Recherche par similarité
- La question de l'utilisateur est elle-même transformée en vecteur.
- Une recherche par distance (cosinus ou L2) est effectuée via pgvector pour récupérer les k chunks les plus pertinents.
- Un filtrage additionnel peut être appliqué (par utilisateur, par module, par matière).

## 5. Étape 4 : Construction du prompt augmenté
- Les chunks récupérés sont assemblés dans un prompt structuré comprenant :
  - Les instructions système (ton pédagogique, exigence de citation des sources).
  - Le contexte documentaire récupéré.
  - La question de l'utilisateur.

## 6. Étape 5 : Génération de la réponse
- Le modèle de génération produit une réponse en s'appuyant exclusivement sur le contexte fourni.
- Chaque affirmation est associée à la référence du document et du passage source.
- En l'absence de contexte pertinent, le système signale explicitement l'incertitude plutôt que d'inventer une réponse.

## 7. Qualité et fiabilité
- Mécanisme de seuil de similarité minimal pour éviter d'utiliser des chunks non pertinents.
- Traçabilité systématique des sources utilisées dans chaque réponse.
- Possibilité pour le formateur de valider ou signaler une réponse générée.

## 8. Évolutivité
- Le module RAG est conçu comme un service indépendant, permettant à terme :
  - Le changement du modèle d'embedding ou de génération sans impact sur le reste du système.
  - L'ajout de sources documentaires externes validées (littérature médicale de référence).
