# Agent Department Host Smoke Validation - 2026-05-03

## Scope

Attempted the requested host-side smoke validation for the merged agent department dry-run/status wrappers.

Only this report file was added.

## Fresh-Origin Update

The required fresh-origin update did not succeed in this checkout. Git metadata writes failed with read-only filesystem errors.

Commands and results:

```text
command: git fetch origin main
exit_code=255
error: cannot open '.git/FETCH_HEAD': Read-only file system

command: git checkout main
exit_code=128
fatal: Unable to create '/home/agent/agent-dev/repos/Knowledge-base/.git/index.lock': Read-only file system

command: git pull --ff-only origin main
exit_code=1
error: cannot open '.git/FETCH_HEAD': Read-only file system

command: git rev-parse HEAD
exit_code=0
8de86eac0835430331124f2f9f6220abecb1eef5

command: git status --short
exit_code=0
?? .codex
```

Commit SHA validated locally:

```text
8de86eac0835430331124f2f9f6220abecb1eef5
```

Because `git fetch`, `git checkout main`, and `git pull --ff-only origin main` failed, this report does not prove validation against a freshly updated `origin/main`.

## Syntax Validation

Command:

```bash
bash -n scripts/agent-dept/agent-dept-runner-main-dry-run scripts/agent-dept/agent-dept-runner-docs-dry-run scripts/agent-dept/agent-dept-runner-tests-dry-run scripts/agent-dept/agent-dept-watchdog-dry-run scripts/agent-dept/agent-dept-status
```

Result:

```text
exit_code=0
stdout/stderr: none
```

## Required Fields

All executed wrapper/status outputs included every required field below with value `no`:

```text
would_claim=no
would_modify_labels=no
would_create_branch=no
would_commit=no
would_push=no
would_create_pr=no
would_merge=no
would_deploy=no
would_start_service=no
would_install_service=no
would_touch_secrets=no
```

## Script Outputs

### scripts/agent-dept/agent-dept-runner-main-dry-run

Result:

```text
exit_code=0
mode=dry-run
lane name: runner-main
lane_name=runner-main
repo target: alanua/Knowledge-base
repo=alanua/Knowledge-base
accepted runner labels: runner:hetzner-main, runner:hetzner, runner:any
accepted lane labels: lane:implementation, lane:recovery
risk labels accepted: risk:green, risk:yellow
blocking labels: blocked, needs:user, needs:chatgpt-review, needs:manual-approval, do-not-run, agent:claimed, agent:running, agent:blocked
would_claim=no
would_modify_labels=no
would_create_branch=no
would_commit=no
would_push=no
would_create_pr=no
would_merge=no
would_deploy=no
would_start_service=no
would_install_service=no
would_touch_secrets=no
```

### scripts/agent-dept/agent-dept-runner-docs-dry-run

Result:

```text
exit_code=0
mode=dry-run
lane name: runner-docs
lane_name=runner-docs
repo target: alanua/Knowledge-base
repo=alanua/Knowledge-base
required labels: agent:task, agent:queued, risk:yellow, lane:docs
compat runner label: runner:hetzner
accepted runner labels: runner:hetzner-docs, runner:hetzner, runner:any
accepted lane labels: lane:docs
risk labels accepted: risk:green, risk:yellow
blocking labels: blocked, needs:user, needs:chatgpt-review, needs:manual-approval, do-not-run, agent:claimed, agent:running, agent:blocked
would_claim=no
would_modify_labels=no
would_create_branch=no
would_commit=no
would_push=no
would_create_pr=no
would_merge=no
would_deploy=no
would_start_service=no
would_install_service=no
would_touch_secrets=no
```

### scripts/agent-dept/agent-dept-runner-tests-dry-run

Result:

```text
exit_code=0
mode=dry-run
lane name: runner-tests
lane_name=runner-tests
repo target: alanua/Knowledge-base
repo=alanua/Knowledge-base
accepted runner labels: runner:hetzner-tests, runner:hetzner, runner:any
accepted lane labels: lane:tests, lane:validate
risk labels accepted: risk:green, risk:yellow
blocking labels: blocked, needs:user, needs:chatgpt-review, needs:manual-approval, do-not-run, agent:claimed, agent:running, agent:blocked
would_claim=no
would_modify_labels=no
would_create_branch=no
would_commit=no
would_push=no
would_create_pr=no
would_merge=no
would_deploy=no
would_start_service=no
would_install_service=no
would_touch_secrets=no
```

### scripts/agent-dept/agent-dept-watchdog-dry-run

Result:

```text
exit_code=0
mode=dry-run
lane name: watchdog
lane_name=watchdog
repo target: alanua/Knowledge-base
repo=alanua/Knowledge-base
accepted runner labels: none for claiming
accepted lane labels: none for claiming
risk labels accepted: none for claiming
blocking labels: blocked, needs:user, needs:chatgpt-review, needs:manual-approval, do-not-run, agent:claimed, agent:running, agent:blocked
health_status_only=yes
would_claim=no
would_modify_labels=no
would_create_branch=no
would_commit=no
would_push=no
would_create_pr=no
would_merge=no
would_deploy=no
would_start_service=no
would_install_service=no
would_touch_secrets=no
```

### scripts/agent-dept/agent-dept-status

Result:

```text
exit_code=0
mode=status
read_only=yes
repo target: alanua/Knowledge-base
repo=alanua/Knowledge-base
lanes=runner-main,runner-docs,runner-tests,watchdog
state_root=/home/agent/.local/state/jeeves-agent-dept/dry-run
accepted runner labels: runner:hetzner-main, runner:hetzner-docs, runner:hetzner-tests, runner:hetzner, runner:any
accepted lane labels: lane:implementation, lane:recovery, lane:docs, lane:tests, lane:validate
risk labels accepted: risk:green, risk:yellow
blocking labels: blocked, needs:user, needs:chatgpt-review, needs:manual-approval, do-not-run, agent:claimed, agent:running, agent:blocked
would_claim=no
would_modify_labels=no
would_create_branch=no
would_commit=no
would_push=no
would_create_pr=no
would_merge=no
would_deploy=no
would_start_service=no
would_install_service=no
would_touch_secrets=no
dry_run_state_root_exists=yes
log_present_hetzner-main=no path=/home/agent/.local/state/jeeves-agent-dept/dry-run/hetzner-main.log
log_present_hetzner-docs=yes path=/home/agent/.local/state/jeeves-agent-dept/dry-run/hetzner-docs.log
log_present_hetzner-tests=no path=/home/agent/.local/state/jeeves-agent-dept/dry-run/hetzner-tests.log
log_present_hetzner-watchdog=no path=/home/agent/.local/state/jeeves-agent-dept/dry-run/hetzner-watchdog.log
log_present_local-reserve-validator=no path=/home/agent/.local/state/jeeves-agent-dept/dry-run/local-reserve-validator.log
```

## Not Changed

- No files under `scripts/agent-dept/` were edited.
- No live Hetzner runner scripts were edited.
- No files under `/home/agent/agent-dev/bin/` were edited.
- No services were started, stopped, enabled, restarted, installed, or created.
- No systemd units were created or modified.
- No secrets, SSH keys, environment files, tokens, production systems, or deployment paths were touched.
- No GitHub labels, issue claims, branches, commits, pushes, PRs, merges, or deployments were created by these wrappers.

## Risks

- The required fresh-origin update failed because `.git/FETCH_HEAD` and `.git/index.lock` could not be written in this checkout.
- Validation reflects the local checked-out scripts at commit `8de86eac0835430331124f2f9f6220abecb1eef5`, not a freshly fetched `origin/main`.
- `git status --short` reported an unrelated untracked `.codex` path.
- `agent-dept-status` reported an existing dry-run state root and one existing docs dry-run log; this validation did not inspect or modify those logs.

## Next Recommended Step

Repeat this exact smoke test from a checkout where Git metadata is writable and `git fetch origin main`, `git checkout main`, and `git pull --ff-only origin main` all succeed before approving live department expansion beyond the current YELLOW/docs runner.
