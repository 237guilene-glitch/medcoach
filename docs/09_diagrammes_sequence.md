# 09 — Diagrammes de séquence

## 1. Séquence : Import et indexation d'un document

```
Étudiant       Frontend        Backend API      File d'attente     Module RAG        PostgreSQL
   │               │                │                  │                │                │
   │ Upload fichier │                │                  │                │                │
   │──────────────►│                │                  │                │                │
   │               │ POST /documents│                  │                │                │
   │               │───────────────►│                  │                │                │
   │               │                │ Sauvegarde métadonnées            │                │
   │               │                │───────────────────────────────────────────────────►│
   │               │                │ Enqueue tâche indexation           │                │
   │               │                │─────────────────►│                │                │
   │               │ 202 Accepted   │                  │                │                │
   │               │◄───────────────│                  │                │                │
   │               │                │                  │ Chunking + Embeddings            │
   │               │                │                  │───────────────►│                │
   │               │                │                  │                │ Insert vecteurs │
   │               │                │                  │                │───────────────►│
   │               │                │  Statut = "indexé" (webhook/poll) │                │
   │               │◄──────────────────────────────────────────────────│                │
```

## 2. Séquence : Question-réponse RAG

```
Étudiant       Frontend        Backend API       Module RAG        PostgreSQL      LLM (génération)
   │               │                │                  │                │                │
   │ Pose question  │                │                  │                │                │
   │──────────────►│                │                  │                │                │
   │               │ POST /rag/query│                  │                │                │
   │               │───────────────►│                  │                │                │
   │               │                │ Recherche vectorielle              │                │
   │               │                │─────────────────►│───────────────►│                │
   │               │                │                  │◄───────────────│ (top-k chunks) │
   │               │                │                  │ Construction prompt augmenté     │
   │               │                │                  │──────────────────────────────────►│
   │               │                │                  │◄───────────────────────────────── │ réponse générée
   │               │  200 OK (réponse + sources)        │                │                │
   │               │◄───────────────│◄─────────────────│                │                │
   │◄──────────────│                │                  │                │                │
```

## 3. Séquence : Génération et correction de quiz

```
Étudiant       Frontend        Backend API       Module Assessment   Module RAG       PostgreSQL
   │               │                │                    │                │               │
   │ Demande quiz   │                │                    │                │               │
   │──────────────►│                │                    │                │               │
   │               │ POST /quiz/generate                  │                │               │
   │               │───────────────►│                    │                │               │
   │               │                │ Sélection contenu   │                │               │
   │               │                │───────────────────►│───────────────►│               │
   │               │                │                    │◄───────────────│ chunks pertinents
   │               │                │◄───────────────────│                │               │
   │               │ 200 OK (questions)                   │                │               │
   │               │◄───────────────│                    │                │               │
   │ Soumet réponses│                │                    │                │               │
   │──────────────►│ POST /quiz/submit                    │                │               │
   │               │───────────────►│ Correction + score  │                │               │
   │               │                │───────────────────►│                │               │
   │               │                │ Sauvegarde résultat │                │               │
   │               │                │────────────────────────────────────────────────────►│
   │               │ 200 OK (score) │                    │                │               │
   │               │◄───────────────│                    │                │               │
```
