# 10 — Diagramme de classes

## 1. Représentation textuelle du modèle de classes

```
┌────────────────────────┐        ┌────────────────────────┐
│         User            │        │        Role             │
├────────────────────────┤        ├────────────────────────┤
│ id: UUID                │ 1    * │ id: UUID                │
│ email: str              │◄──────►│ name: str (etudiant,    │
│ password_hash: str      │        │       formateur, admin) │
│ full_name: str          │        └────────────────────────┘
│ created_at: datetime    │
└─────────────┬───────────┘
              │ 1
              │
              │ *
┌─────────────▼───────────┐        ┌────────────────────────┐
│        Document          │        │       DocumentChunk      │
├───────────────────────────┤ 1    * ├────────────────────────┤
│ id: UUID                 │◄──────►│ id: UUID                │
│ owner: User (FK)          │        │ document: Document (FK) │
│ title: str                │        │ content: text           │
│ file_path: str            │        │ embedding: vector(N)    │
│ status: enum               │        │ position: int           │
│ uploaded_at: datetime      │        └────────────────────────┘
└───────────────────────────┘

┌────────────────────────┐        ┌────────────────────────┐
│         Quiz             │        │       Question           │
├────────────────────────┤ 1    * ├────────────────────────┤
│ id: UUID                 │◄──────►│ id: UUID                │
│ document: Document (FK)   │        │ quiz: Quiz (FK)          │
│ owner: User (FK)          │        │ text: str                │
│ created_at: datetime      │        │ choices: JSON             │
└─────────────┬─────────────┘        │ correct_answer: str       │
              │ 1                    └────────────────────────┘
              │
              │ *
┌─────────────▼───────────┐
│       QuizAttempt         │
├───────────────────────────┤
│ id: UUID                 │
│ quiz: Quiz (FK)           │
│ user: User (FK)           │
│ score: float               │
│ answered_at: datetime      │
└───────────────────────────┘

┌────────────────────────┐
│    ProgressRecord        │
├────────────────────────┤
│ id: UUID                 │
│ user: User (FK)           │
│ topic: str                │
│ mastery_score: float       │
│ updated_at: datetime       │
└────────────────────────┘
```

## 2. Description des entités principales
- **User** : représente un utilisateur, associé à un ou plusieurs rôles.
- **Role** : type d'utilisateur (étudiant, formateur, administrateur).
- **Document** : fichier importé par un utilisateur, avec un statut d'indexation.
- **DocumentChunk** : segment de texte issu d'un document, associé à son embedding vectoriel (pgvector).
- **Quiz** : ensemble de questions générées à partir d'un document.
- **Question** : question individuelle d'un quiz, avec choix de réponses.
- **QuizAttempt** : tentative d'un utilisateur sur un quiz, avec score obtenu.
- **ProgressRecord** : indicateur de maîtrise d'un utilisateur sur un thème donné.

## 3. Relations clés
- Un `User` possède plusieurs `Document` (relation 1-N).
- Un `Document` est découpé en plusieurs `DocumentChunk` (relation 1-N).
- Un `Document` peut générer plusieurs `Quiz`, chacun composé de plusieurs `Question`.
- Un `User` peut avoir plusieurs `QuizAttempt` et plusieurs `ProgressRecord`.
