# Agent Department Fresh-Origin Smoke Validation - 2026-05-03

## Scope

Attempted the requested fresh-origin smoke gate for the Jeeves agent department dry-run/status wrappers from a writable checkout.

Only this docs evidence report was added.

This report does not approve live autonomous department expansion. ChatGPT review and user approval remain required before any live authority increase.

## Writable Checkout

The existing checkout was writable for normal files, but Git metadata writes failed:

```text
error: cannot open '.git/FETCH_HEAD': Read-only file system
fatal: Unable to create '/home/agent/agent-dev/repos/Knowledge-base/.git/index.lock': Read-only file system
```

A fresh temporary clone was attempted under `/tmp`:

```text
command: git clone https://github.com/alanua/Knowledge-base.git /tmp/kb-fresh-origin-smoke-147-20260503-1
exit_code=128
Cloning into '/tmp/kb-fresh-origin-smoke-147-20260503-1'...
fatal: unable to access 'https://github.com/alanua/Knowledge-base.git/': Could not resolve host: github.com
```

Because the fresh clone could not reach GitHub, a writable `/tmp` copy of the current checkout was used only to execute the local syntax and wrapper smoke checks:

```text
/tmp/kb-fresh-origin-smoke-147-copy/Knowledge-base
```

## Fresh-Origin Commands

Commands run in the writable `/tmp` copy:

```bash
git fetch origin main
git checkout main
git pull --ff-only origin main
git rev-parse HEAD
git status --short
```

Result:

```text
fatal: unable to access 'https://github.com/alanua/Knowledge-base.git/': Could not resolve host: github.com
Switched to branch 'main'
Your branch is up to date with 'origin/main'.
fatal: unable to access 'https://github.com/alanua/Knowledge-base.git/': Could not resolve host: github.com
d737f634dae9a5a892432a4d02b2dcc0cca6718c
?? .codex
```

Commit SHA tested locally:

```text
d737f634dae9a5a892432a4d02b2dcc0cca6718c
```

Fresh-origin result:

```text
fresh_origin_gate_passed=no
reason=git fetch and git pull --ff-only could not reach github.com from this environment
```

The prior read-only Git metadata blocker was avoided by using a writable copy, but the fresh-origin gate remains unproven because origin could not be contacted.

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

All five executed dry-run/status outputs included every required `would_*` field below with value `no`:

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

- No live department expansion was performed.
- No daemon, service, systemd, or timer files were changed.
- No runner authority was expanded.
- No labels were mutated by the wrappers.
- No issues were claimed by the wrappers.
- No live runner scripts were edited.
- No files under `/home/agent/agent-dev/bin/` were edited.
- No deploy, merge, commit, push, or PR creation was performed by this run.
- No secrets, SSH keys, environment files, tokens, repository settings, production systems, or deployment paths were touched.
- Jeeves was not marked as department manager.

## Gate Result

```text
syntax_validation_passed=yes
dry_run_status_wrappers_passed=yes
required_would_fields_all_no=yes
fresh_origin_gate_passed=no
blocks_live_expansion=yes
```

This still blocks live expansion. The dry-run/status wrappers remained inert in local execution, but the required fresh-origin proof was not completed because `origin/main` could not be fetched or pulled from this environment.
