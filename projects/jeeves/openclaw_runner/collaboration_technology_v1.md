# Jeeves / OpenClaw Runner — Collaboration Technology v1

Status: canonical draft v1
Project: Jeeves / OpenClaw-style personal agent
Purpose: define how the user, ChatGPT, Codex, OpenClaw, local LLM, cloud sandbox and GitHub work together without losing control, security or architectural consistency.

## 1. Core principle

OpenClaw is not the product core and not an autonomous project owner.

OpenClaw is used as a controlled development runner around coding agents.

Canonical chain:

```text
User -> ChatGPT -> Task Prompt -> OpenClaw Runner -> Codex / Local LLM / Tools -> GitHub Branch / Logs -> ChatGPT Review -> User Decision
```

Decision ownership:

```text
User      = operator / owner / final decision
ChatGPT   = architect / tech lead / reviewer / task author
Codex     = primary coding executor
OpenClaw  = dev-runner / workflow shell / skill harness
Ollama    = local low-cost helper for simple tasks
GitHub    = source of truth and knowledge base
Hetzner   = sandbox runner first, production runtime later
```

## 2. Team model

The practical team is not expanded with another decision-maker. OpenClaw is a tool layer.

```text
Human team:
- User
- ChatGPT
- Codex

Tooling layer:
- OpenClaw
- Ollama
- GitHub
- Lovable where UI is needed
- Hetzner sandbox where long or headless runs are needed
```

OpenClaw must not become:

```text
- architect
- source of truth
- security owner
- production deployer
- autonomous product manager
- direct main-branch writer
```

## 3. Runtime split: local and cloud

Use both local and cloud, but with different trust levels.

### 3.1 Local PC / WSL / Docker

Local environment is the main development workshop.

Allowed:

```text
- real development repo
- dev branches
- Codex CLI
- OpenClaw local runner
- Ollama local LLM
- tests, lint, diff review
- own skills only
```

Forbidden:

```text
- production secrets in OpenClaw workspace
- direct push to main
- unrestricted disk access
- random third-party skills
- access to unrelated personal files
```

### 3.2 Hetzner cloud sandbox

Cloud environment is disposable and lower-trust.

Allowed:

```text
- temporary sandbox VPS
- cloned repo without secrets
- test branch only
- long coding sessions
- headless OpenClaw runner tests
- CI-like test runs
- logs and PR preparation
```

Forbidden:

```text
- production .env
- production database
- production SSH keys
- open OpenClaw port to the public internet
- main branch write access
- banking/email/personal credentials
- direct deployment to production
```

Cloud OpenClaw is always treated as replaceable. After experiments it may be destroyed or rebuilt.

## 4. Network policy

OpenClaw local/cloud may have outbound access only where required for development.

Allowed network access:

```text
- GitHub HTTPS
- OpenAI / Codex / OpenRouter if configured
- package registries needed for build: npm, pip, Docker registry
- Ollama localhost on local machine
- SSH tunnel or Tailscale for private access
```

Forbidden network access:

```text
- public inbound OpenClaw UI/API
- unrestricted LAN scanning
- access to router/NAS/other PCs
- access to production Hetzner from sandbox
- arbitrary webhook exposure
```

Access to OpenClaw UI/API must be local-only or via SSH tunnel/Tailscale.

## 5. GitHub model

GitHub is the source of truth.

Repositories:

```text
alanua/Knowledge-base = canonical knowledge, policies, workflows, task templates
project repos          = implementation source code
```

Branch rules:

```text
main                    = protected by human/reviewer decision
codex/<task-name>       = coding executor branches
dev/openclaw-runner     = OpenClaw setup experiments
sandbox/<task-name>     = disposable cloud experiments
```

OpenClaw and Codex may create branches and prepare commits/PRs, but must not merge to main without review.

## 6. Task lifecycle

Every task follows one bounded flow.

```text
1. User states goal.
2. ChatGPT converts goal into a bounded task prompt.
3. Task is placed in GitHub or passed to OpenClaw.
4. OpenClaw launches Codex/local tool according to allowed scope.
5. Executor edits only allowed files.
6. Executor runs tests/lint.
7. Executor produces summary and diff.
8. ChatGPT reviews result.
9. User accepts, rejects or asks for rework.
10. Only accepted work may be merged.
```

No open-ended autonomous work.

## 7. Standard task prompt format

All coding tasks must use this format:

```markdown
# TASK
Clear one-sentence goal.

# CONTEXT
Project/module background needed to avoid wrong assumptions.

# SCOPE
Files/directories/modules that may be changed.

# ALLOWED
- concrete allowed actions
- commands that may be run
- tests that should be executed

# FORBIDDEN
- files or areas that must not be touched
- secrets
- production deployment
- main branch writes
- unrelated refactoring

# ACCEPTANCE CRITERIA
- exact expected behavior
- tests/lint passing requirements
- no regressions in named flows

# OUTPUT REQUIRED
- changed files
- commands run
- test/lint result
- diff summary
- risks found
- next recommendation
```

## 8. Executor output contract

Every OpenClaw/Codex run must end with a machine-readable or clearly structured summary:

```text
1. Branch name
2. Commit hash, if committed
3. Changed files
4. Summary of changes
5. Commands run
6. Test/lint results
7. Known risks
8. Files intentionally not touched
9. Suggested next step
```

If tests fail, executor must not hide it. Failed tests are valid output.

## 9. Skills policy

Only allowlisted skills may be used.

Initial allowed skills:

```text
- run-tests
- run-lint
- repo-audit
- prepare-codex-task
- review-diff-summary
- update-knowledge-base
- docs-update
```

Forbidden by default:

```text
- unknown third-party skills
- skills that read all home directory files
- skills that access credentials
- skills that execute curl | bash from unknown sources
- skills that modify shell profile files
- skills that open inbound network services
```

Any new skill must be reviewed before enabling.

## 10. Local LLM role

Local LLM through Ollama is useful but not trusted as the main coder.

Use local LLM for:

```text
- simple explanations
- small file analysis
- diff summaries
- task classification
- boilerplate drafts
- cheap pre-review
```

Do not rely on local LLM for:

```text
- security-critical code
- database migrations without review
- policy engine changes
- memory subsystem design
- large refactors
- production fixes
```

## 11. Long sessions without the user

Long sessions are allowed only in bounded executor mode.

Allowed unattended work:

```text
- execute a predefined task queue
- create branch
- edit scoped files
- run tests/lint
- produce logs and summaries
- stop after task completion or failure
```

Forbidden unattended work:

```text
- invent new product direction
- merge to main
- deploy production
- access secrets
- change security/policy core without explicit task
- start unrelated tasks
```

For long sessions, prefer Hetzner sandbox or local machine with isolated workspace.

## 12. Logging and audit

Each run should leave traceable artifacts:

```text
- task prompt
- branch name
- execution log
- commands run
- test/lint result
- diff summary
- review decision
```

Preferred locations:

```text
project repo:      .agent-runs/<date>/<task-id>/
Knowledge-base:    projects/jeeves/openclaw_runner/task_queue.md
GitHub PR:         PR description and comments
```

Do not store secrets, tokens or private credentials in logs.

## 13. Review rules

ChatGPT review checks:

```text
- task scope was respected
- no unrelated files changed
- no secrets touched
- no main/prod changes
- tests/lint result is clear
- architecture remains compatible with canonical model
- security/policy boundaries are preserved
```

User decision states:

```text
ACCEPT
REWORK
REJECT
PAUSE
```

## 14. Initial setup target

Tomorrow setup should aim for this minimal working chain:

```text
Local PC / WSL
  -> Git clone repo
  -> Codex CLI authenticated
  -> OpenClaw installed locally
  -> one allowlisted skill
  -> one test task on a dev branch
  -> diff produced
  -> tests/lint run
  -> ChatGPT review
```

Cloud setup comes after local proof:

```text
Hetzner sandbox
  -> firewall only SSH
  -> no public OpenClaw port
  -> repo clone without secrets
  -> test branch only
  -> same test task repeated
  -> compare local vs cloud usefulness
```

## 15. Canonical decision

Adopt OpenClaw as a controlled dev-runner for Jeeves and related projects.

Do not adopt OpenClaw as the architecture base, memory core, policy engine or production runtime.

The durable project architecture remains Jeeves-owned. OpenClaw is a replaceable development accelerator.
