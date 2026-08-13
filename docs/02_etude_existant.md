# 02 — Étude de l'existant

## 1. Solutions existantes sur le marché
- **Anki / plateformes de flashcards** : efficaces pour la mémorisation par répétition espacée, mais ne proposent pas de génération de réponses contextuelles ni d'exploitation sémantique de documents.
- **ChatGPT / assistants génériques** : capacité conversationnelle forte, mais absence de contrôle sur les sources, risque d'hallucination, pas d'ancrage sur le corpus spécifique de l'étudiant.
- **Plateformes e-learning médicales (UpToDate, plateformes universitaires)** : contenu de qualité mais peu interactif, pas de personnalisation par IA, souvent payant et fermé.
- **Outils RAG génériques (Notion AI, custom GPTs)** : permettent l'import de documents mais manquent de spécialisation métier (structuration médicale, citations académiques, suivi pédagogique).

## 2. Analyse comparative
| Critère | Anki | ChatGPT générique | E-learning médical | MedCoach (cible) |
|---|---|---|---|---|
| Personnalisation du corpus | Non | Partielle | Non | Oui |
| Sourcing des réponses | N/A | Faible | Oui | Oui |
| Suivi de progression | Basique | Non | Oui | Oui |
| Mode hors-ligne | Oui | Non | Non | Partiel (PWA) |
| Spécialisation médicale | Non | Non | Oui | Oui |

## 3. Limites identifiées de l'existant
- Manque d'outils combinant fiabilité des sources et personnalisation par IA générative.
- Absence de contrôle de l'étudiant sur le corpus utilisé pour générer les réponses.
- Peu de solutions proposent un pipeline RAG transparent et auditable pédagogiquement.

## 4. Opportunités pour MedCoach
- Combiner la rigueur documentaire (citations, traçabilité) avec la flexibilité conversationnelle d'un LLM.
- Offrir un contrôle total à l'étudiant sur son corpus de révision personnel.
- Intégrer un suivi analytique des lacunes de connaissances.

## 5. Conclusion
L'étude de l'existant confirme la pertinence d'une architecture RAG dédiée au contexte médical, différenciée par la traçabilité des sources, la personnalisation du corpus et le suivi pédagogique intégré.
