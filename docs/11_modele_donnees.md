# 11 — Modèle de données

## 1. Schéma relationnel (PostgreSQL + pgvector)

### Table `users_user`
| Champ | Type | Contraintes |
|---|---|---|
| id | UUID | PK |
| email | VARCHAR(255) | UNIQUE, NOT NULL |
| password_hash | VARCHAR(255) | NOT NULL |
| full_name | VARCHAR(255) | NOT NULL |
| role | VARCHAR(20) | NOT NULL (etudiant, formateur, admin) |
| created_at | TIMESTAMP | NOT NULL DEFAULT now() |

### Table `documents_document`
| Champ | Type | Contraintes |
|---|---|---|
| id | UUID | PK |
| owner_id | UUID | FK → users_user(id) |
| title | VARCHAR(255) | NOT NULL |
| file_path | TEXT | NOT NULL |
| status | VARCHAR(20) | NOT NULL (pending, processing, indexed, error) |
| uploaded_at | TIMESTAMP | NOT NULL DEFAULT now() |

### Table `documents_chunk`
| Champ | Type | Contraintes |
|---|---|---|
| id | UUID | PK |
| document_id | UUID | FK → documents_document(id) |
| content | TEXT | NOT NULL |
| embedding | VECTOR(1536) | NOT NULL (extension pgvector) |
| position | INTEGER | NOT NULL |

### Table `assessment_quiz`
| Champ | Type | Contraintes |
|---|---|---|
| id | UUID | PK |
| document_id | UUID | FK → documents_document(id) |
| owner_id | UUID | FK → users_user(id) |
| created_at | TIMESTAMP | NOT NULL DEFAULT now() |

### Table `assessment_question`
| Champ | Type | Contraintes |
|---|---|---|
| id | UUID | PK |
| quiz_id | UUID | FK → assessment_quiz(id) |
| text | TEXT | NOT NULL |
| choices | JSONB | NOT NULL |
| correct_answer | VARCHAR(255) | NOT NULL |

### Table `assessment_quizattempt`
| Champ | Type | Contraintes |
|---|---|---|
| id | UUID | PK |
| quiz_id | UUID | FK → assessment_quiz(id) |
| user_id | UUID | FK → users_user(id) |
| score | FLOAT | NOT NULL |
| answered_at | TIMESTAMP | NOT NULL DEFAULT now() |

### Table `progression_progressrecord`
| Champ | Type | Contraintes |
|---|---|---|
| id | UUID | PK |
| user_id | UUID | FK → users_user(id) |
| topic | VARCHAR(255) | NOT NULL |
| mastery_score | FLOAT | NOT NULL DEFAULT 0 |
| updated_at | TIMESTAMP | NOT NULL DEFAULT now() |

## 2. Index et optimisations
- Index vectoriel IVFFlat ou HNSW sur `documents_chunk.embedding` (extension pgvector) pour accélérer la recherche par similarité.
- Index B-Tree sur `owner_id`, `document_id`, `user_id` pour les jointures fréquentes.
- Index sur `status` de `documents_document` pour le filtrage rapide côté supervision.

## 3. Exemple de requête de recherche vectorielle
```sql
SELECT id, content, document_id,
       embedding <-> '[...]'::vector AS distance
FROM documents_chunk
ORDER BY distance ASC
LIMIT 5;
```

## 4. Politique de rétention et confidentialité
- Suppression en cascade des `DocumentChunk` lors de la suppression d'un `Document`.
- Anonymisation ou suppression des données utilisateur sur demande (conformité RGPD).
- Sauvegardes régulières chiffrées de la base de données.
