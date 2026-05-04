# Gemini Antigravity Sandbox Worker Policy - 2026-05-04

## 1. Status/Scope

Status: draft external-policy evidence note
Scope: ChatGPT exoskeleton policy for possible Gemini use inside Google
Antigravity as a sandboxed dev-auditor/prototype worker for the Jeeves pipeline.

This is a docs-only policy note. It does not implement, configure, connect,
install, deploy, merge, grant credentials, grant repository authority, grant
private source access, or authorize runtime behavior.

## 2. Canon Status

```text
canon_status = not_canon
```

This document records external policy evidence for later review. It is not a
canon promotion and does not modify Jeeves authority.

## 3. Source Material Status

Source material: Gemini external evidence summary supplied in GitHub Issue #253.

The source material is accepted only as policy evidence. It is not treated as an
operational approval, runner instruction, secret-handling plan, or permission to
operate Antigravity.

## 4. Relationship To ChatGPT Exoskeleton

Gemini plus Antigravity may be considered only as an isolated worker role under
the ChatGPT exoskeleton pipeline. The ChatGPT exoskeleton remains the architect,
control plane, canon gate, and task issuer.

Gemini reports are evidence for ChatGPT review. They are not direct authority to
change canon, repositories, branches, runners, deployments, or production
systems.

## 5. Gemini Response Assessment

```text
semantic_result = pass
strict_schema_result = pass
recommended_route = accept_as_external_policy_evidence_only
canon_status = not_canon
```

Gemini's proposed role and boundary model are directionally useful for a
sandboxed worker, but the acceptance is limited to external policy evidence.

## 6. Accepted Role Model

```text
Oleksii = final approval / owner
ChatGPT exoskeleton = architect / control plane / canon gate / task issuer
Gemini + Antigravity = isolated dev-auditor / prototype worker / multimodal UI reviewer
Runner = bounded executor through GitHub issues and draft PRs
```

## 7. Accepted Gemini Proposal Points

Accepted as evidence for possible sandbox use:

```text
frontend localhost visual verification
isolated static analysis and linters on draft PR bundles
dependency update simulation in detached workspace
stateless red-team/security fuzzing of mock architecture
non-authoritative patch/diff drafting for ChatGPT review
```

Accepted boundary points:

```text
no remote pushes
no PR merges or GitHub issue management
no deploys
no live API keys/secrets/tokens
no internal VPC/production/private memory access
no runner policy-gate override
ephemeral workspace
no live credentials in env
allow-listed or air-gapped network
mocked/sanitized data only
localhost browser only
no curl/wget to live external APIs
```

## 8. Corrected/Modified Gemini Proposal Points

Required corrections:

```text
recommended_route=accept means accept as policy evidence only, not authorization to operate Antigravity.
Structured JSON should return to ChatGPT exoskeleton/control plane; Runner may transport later only if separately authorized.
Diff/patch strings are non-authoritative proposals, not direct code changes.
Static analysis/lint/build commands are allowed only in a sandbox with no secrets and no live external access.
Dependency simulations must not install untrusted packages without explicit approval or safe mocked/offline constraints.
Private memory requires separate explicit private triage approval; public policy docs must remain redacted.
```

## 9. Allowed Use Cases

Allowed only inside a sanitized sandbox with the isolation requirements in this
document:

```text
BauClock UI smoke review with screenshots
local frontend/browser verification
repo/document consistency audit
runner report audit
PR pre-review report
throwaway sandbox prototype
non-authoritative parser prototype report
multimodal UI/mockup/spec comparison
static lint/build/test in sanitized sandbox
```

## 10. Forbidden Capabilities

Gemini plus Antigravity must not receive or exercise:

```text
GitHub token with write access
SSH keys
.env files
production logs
Hetzner/server access
Drive/Gmail/private docs direct access
secrets/tokens/cookies/OAuth credentials
real account IDs/private IDs
direct repo writes to main
merge/deploy/restart services
runner control
service/systemd/network/container/firewall changes
automatic code execution without approval
private source ingestion without explicit separate approval
canon promotion
BauClock production edits
Jeeves runtime authority expansion
```

## 11. Workspace Isolation Requirements

The worker environment must use:

```text
separate clone or disposable workspace
test branch only
no production branch writes
no mounted private folders by default
no inherited shell secrets
no global credentials
no live server credentials
safe terminal approval mode for risky commands
```

Dependency experiments must be mocked, offline, pinned, or explicitly approved
before any package installation or execution. The default network posture is
allow-listed or air-gapped.

## 12. Repository Access Policy

Repository access is read-only unless a separate future task explicitly
authorizes a narrow draft-PR workflow. The worker may inspect only the public or
sanitized repository material provided for the task.

Repository rules:

```text
no direct main commits
no production branch writes
no direct repo writes to main
no push unless explicitly authorized by separate task
if commits are allowed later, draft PR only
ChatGPT review required
Oleksii approval required before merge
```

Private source ingestion requires separate explicit approval and must not be
implied by this policy.

## 13. Terminal/Browser/Editor Policy

Terminal use must be bounded by task-specific approval and sandbox controls.
Risky commands require safe terminal approval mode.

Browser use is limited to:

```text
localhost browser only
local/dev/public-safe targets unless separately approved
no curl/wget to live external APIs
```

Editor use may produce notes, screenshots, reports, and non-authoritative
patch/diff proposals. It must not directly apply changes to authoritative
repositories or production paths.

## 14. Data/Privacy Policy

Allowed data is limited to public-safe, mocked, redacted, or sanitized material
for the assigned task.

Forbidden data includes:

```text
live API keys/secrets/tokens
cookies/OAuth credentials
SSH keys
.env files
production logs
real account IDs/private IDs
internal VPC data
private memory without separate explicit private triage approval
Drive/Gmail/private docs direct access
```

Public policy docs must remain redacted.

## 15. Artifact/Reporting Requirements

Reports and artifacts must include:

```text
plan
findings
screenshots where relevant
commands attempted/requested
verification summary
risk notes
changed files list if any
patch/diff proposal if any
non-authorizations
next recommended action
```

Reports are evidence only. Screenshots, proposed diffs, static-analysis output,
and UI observations do not authorize direct repository changes.

## 16. PR/Branch Policy

Required PR and branch model:

```text
one task = one branch = one report
test branch only
no direct main commits
no auto-merge
no push unless explicitly authorized by separate task
if commits are allowed later, draft PR only
ChatGPT review required
Oleksii approval required before merge
```

The Runner remains the bounded executor through GitHub issues and draft PRs.
Gemini plus Antigravity must not manage GitHub issues, merge PRs, override
policy gates, or expand runner authority.

## 17. Security Risks And Mitigations

Risk: credential exposure through inherited shells, mounted folders, browser
profiles, package managers, or editor state.

Mitigation: use disposable workspaces, no inherited shell secrets, no global
credentials, no mounted private folders by default, and no live server
credentials.

Risk: unauthorized code execution or dependency execution.

Mitigation: require explicit approval for risky commands; prefer offline,
mocked, pinned, or sanitized simulations; block untrusted package installation
unless separately approved.

Risk: accidental authority expansion through reports, JSON output, patches, or
diff strings.

Mitigation: all outputs are evidence only; ChatGPT exoskeleton review and
Oleksii approval remain required before any operational action.

Risk: private source or memory leakage into public policy docs.

Mitigation: private memory requires separate explicit private triage approval;
public policy docs remain redacted.

## 18. First Safe Tasks

Initial safe tasks should be evidence-producing only:

```text
BauClock UI smoke review with screenshots against localhost or public-safe mock
local frontend/browser verification report
repo/document consistency audit report
runner report audit
PR pre-review report
throwaway sandbox prototype report
non-authoritative parser prototype report
multimodal UI/mockup/spec comparison report
static lint/build/test report in sanitized sandbox
```

## 19. Block Conditions

Stop and return to ChatGPT/Oleksii if a task requires:

```text
secrets, tokens, cookies, OAuth credentials, SSH keys, or .env files
production logs or production access
Hetzner/server access
Drive/Gmail/private docs direct access
private source ingestion without explicit separate approval
GitHub write token or issue-management authority
runner control or runner policy-gate override
service/systemd/network/container/firewall changes
deploy, merge, restart, or production edit
BauClock production edits
Jeeves runtime authority expansion
canon promotion
```

## 20. Non-Authorizations

This document must not authorize:

```text
installing or configuring Antigravity
connecting Gemini API
creating/storing API keys
GitHub write tokens
OAuth setup
Google Cloud setup
Drive/Gmail/NotebookLM access
private source access
runner changes
runner script edits
service/systemd/network/container/firewall changes
deploy
merge
production access
secret storage
secret inspection
BauClock production edits
Jeeves runtime authority expansion
Jeeves department-manager status
autonomous correction loops
autonomous self-improvement
```

## 21. Next Recommended Task

Next recommended task: create a separate, explicitly authorized review task for
ChatGPT exoskeleton to evaluate this policy note and decide whether a
non-operational Antigravity sandbox checklist should be drafted.

Any later task to install Antigravity, connect Gemini, configure credentials,
push branches, create draft PRs, access private source, or run live tooling must
be separately authorized and must restate its allowed files, authority boundary,
secret policy, and validation requirements.
