# Obsidian Setup for Knowledge-base

## Goal
Use the GitHub Knowledge-base repository as the canonical source of truth and open the same repository as an Obsidian vault.

## Recommended setup
1. Clone `alanua/Knowledge-base` locally.
2. Open the cloned folder as an Obsidian vault.
3. Do not create nested vaults inside the repository.
4. Keep all canonical project knowledge in Markdown files tracked by Git.
5. Use Obsidian only as the working interface, not as a separate source of truth.

## Recommended folders
- `projects/`
- `_templates/`
- `tools/`
- `inbox/` for temporary notes
- `attachments/` for diagrams or exported assets when needed

## Rules
- canonical decisions must go to project `decisions.md`
- current state must go to project `handoff.md`
- active work must go to project `tasks.md`
- do not store secrets in the vault
- do not keep important information only in local-only notes

## Suggested workflow
1. Work in Obsidian.
2. Commit changes to GitHub.
3. Use GitHub links or file content when asking ChatGPT to analyze or update the knowledge base.
