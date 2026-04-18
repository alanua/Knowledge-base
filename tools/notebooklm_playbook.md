# NotebookLM Playbook

## Goal
Use NotebookLM as an analysis layer on top of structured project knowledge and external documents.

## When to use NotebookLM
- large document analysis
- legal documents (contracts, DPA, AVV)
- long technical logs
- research aggregation
- onboarding / briefing generation

## What NOT to use it for
- canonical architecture
- system decisions
- source of truth

## Setup per project
1. Create a Notebook per project (e.g. BauClock).
2. Add sources:
   - exported Markdown from Knowledge-base
   - PDFs
   - Google Docs
   - URLs
3. Keep number of sources focused (avoid dumping everything).

## Important limitations
- sources are static copies
- updates require manual re-sync or re-upload
- notebooks are isolated from each other

## Workflow
1. Upload sources.
2. Ask structured questions.
3. Extract insights.
4. Bring insights back into Knowledge-base.
5. Convert validated insights into decisions or architecture.

## Rule
NotebookLM outputs are NOT decisions until written into Knowledge-base.
