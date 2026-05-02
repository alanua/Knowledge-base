# Hetzner Runner Autonomous Loop Recovery - 2026-05-02

Status: docs-only diagnostic and recovery proposal
Scope: Knowledge-base lane:docs YELLOW task #108
Host inspected: `hetzner-agent-runner-1`
Inspection time: 2026-05-02 UTC

## Safety Boundary

This report did not start, stop, enable, restart, install, or create any live service, timer, daemon, cron entry, systemd unit, secret, deployment, or runner script.

No files outside `projects/jeeves/` were modified. Live runner scripts under `/home/agent/agent-dev/bin/` were inspected read-only only.

## Diagnostics Performed

Required command results:

```text
whoami
agent

pwd
/home/agent/agent-dev/repos/Knowledge-base

hostname
hetzner-agent-runner-1

systemctl --user list-units --type=service --type=timer --all | grep -Ei 'agent|jeeves|runner|yellow|green|dept' || true
Failed to connect to bus: Operation not permitted

systemctl list-units --type=service --type=timer --all | grep -Ei 'agent|jeeves|runner|yellow|green|dept' || true
Failed to connect to bus: Operation not permitted

ps -ef | grep -Ei 'agent-run-next|agent.*runner|jeeves|yellow|green' | grep -v grep || true
no matching process output

crontab -l || true
crontabs/agent/: fopen: Permission denied
```

Directory inventory highlights:

```text
/home/agent/agent-dev/bin contains:
- agent-run-next-yellow
- agent-run-yellow-loop
- agent-run-yellow-daemon
- agent-yellow-daemon-start
- agent-yellow-daemon-status
- agent-run-next-green
- agent-run-green-loop
- agent-run-green-daemon
- agent-daemon-start
- agent-daemon-status
- multiple 20260430 yellow backup copies

/home/agent/agent-dev/logs contains:
- agent-yellow-daemon.out
- agent-yellow-daemon.pid
- agent-green-daemon.out
- manual yellow run logs for issues #82, #85, #86, #91, #98, #102
- yellow-recovery-autoloop-issue108-20260502-183849.log

/home/agent/agent-dev/agent-runs contains:
- many historical yellow Knowledge-base run directories
- recent manual-looking runs for #82, #85, #86, #91, #98, #102, and #108
```

Additional read-only status checks:

```text
/home/agent/agent-dev/bin/agent-yellow-daemon-status
=== yellow daemon process ===
no matching process output

last yellow daemon log tick:
=== YELLOW DAEMON TICK 2026-05-02 08:05:20 UTC ===
=== YELLOW TASK 1/1 ===
NO_YELLOW_TASK
YELLOW_QUEUE_EMPTY

/home/agent/agent-dev/bin/agent-daemon-status
=== daemon process ===
not running

last green daemon log tick:
=== DAEMON TICK 2026-05-02 08:02:14 UTC ===
=== RUN HETZNER GREEN LOOP ===
=== GREEN TASK 1/3 ===
NO_GREEN_TASK
QUEUE_EMPTY

current UTC check during diagnostics:
2026-05-02 18:40:04 UTC

yellow pid file:
pid_file=56405
ps -p 56405 returned no process
```

Source-controlled documents inspected:

```text
projects/jeeves/agent_development_department_v1.md
projects/jeeves/agent_department_hetzner_lane_scripts_plan.md
projects/jeeves/runner_health_status_2026_05_02_v1.md
projects/jeeves/runner_lane_docs_next_step_plan_2026_05_02_v1.md
projects/jeeves/agent_runner_read_only_host_inventory_v1.md
scripts/agent-dept/ read-only inventory
```

## What Autonomous Mechanism Likely Existed

The currently proven autonomous mechanism is a host-side `nohup` shell daemon loop, not a proven systemd user service, systemd timer, cron job, tmux session, or screen session.

Likely YELLOW chain:

```text
/home/agent/agent-dev/bin/agent-yellow-daemon-start
  -> nohup /home/agent/agent-dev/bin/agent-run-yellow-daemon 1200 1
  -> /home/agent/agent-dev/bin/agent-run-yellow-loop 1
  -> /home/agent/agent-dev/bin/agent-run-next-yellow
```

Observed script behavior:

```text
agent-yellow-daemon-start:
- writes /home/agent/agent-dev/logs/agent-yellow-daemon.out
- writes /home/agent/agent-dev/logs/agent-yellow-daemon.pid
- starts the daemon with nohup
- first kills any existing agent-run-yellow-daemon process with pkill -f

agent-run-yellow-daemon:
- loops forever
- sleeps 1200 seconds by default
- calls agent-run-yellow-loop once per tick

agent-run-yellow-loop:
- calls agent-run-next-yellow once per batch item
- exits cleanly when NO_YELLOW_TASK or YELLOW_RUNNER_BUSY appears

agent-run-next-yellow:
- uses flock on /home/agent/agent-dev/.agent-runner.lock on this host
- searches GitHub Issues for agent:task, agent:queued, risk:yellow, and runner:hetzner or runner:any
- mutates task labels only after selecting an issue
- creates run directories, branches, draft PRs, reports, and completion or blocked labels
```

Likely GREEN chain:

```text
/home/agent/agent-dev/bin/agent-daemon-start
  -> nohup /home/agent/agent-dev/bin/agent-run-green-daemon 900 3
  -> /home/agent/agent-dev/bin/agent-run-green-loop 3
  -> /home/agent/agent-dev/bin/agent-run-next-green
```

Systemd and cron state are not proven. Both `systemctl` commands were blocked by bus access in this environment, and `crontab -l` was blocked by crontab file permission. The absence of matching `ps` output proves only that no matching long-running process was visible during this diagnostic check.

## What Is Currently Active Or Inactive

Currently active:

```text
- GitHub Issue intake remains the active queue shape per merged docs.
- The YELLOW single-task entrypoint exists at /home/agent/agent-dev/bin/agent-run-next-yellow.
- The YELLOW loop and daemon helper scripts exist.
- The YELLOW runner lock plan exists inside agent-run-next-yellow via flock.
- Historical logs and run directories prove prior loop execution.
```

Currently inactive or not visible:

```text
- No agent-run-next, agent runner, Jeeves, yellow, or green daemon process matched ps during diagnostics.
- /home/agent/agent-dev/logs/agent-yellow-daemon.pid points to PID 56405, but that PID is not active.
- The last yellow daemon log tick observed was 2026-05-02 08:05:20 UTC.
- The last green daemon log tick observed was 2026-05-02 08:02:14 UTC.
```

Currently unknown:

```text
- systemd user service or timer presence, because systemctl --user could not connect to the bus.
- system-level service or timer presence, because systemctl could not connect to the bus.
- cron scheduling, because crontab -l returned permission denied.
- whether a supervisor used to restart the nohup daemons after shell logout, reboot, or crash.
```

## Why Manual Push Is Currently Needed

The issue picker itself exists, but the observed autonomous caller is not running.

The runner can still execute when manually invoked because `/home/agent/agent-dev/bin/agent-run-next-yellow` and its loop wrappers are present. However, without an active scheduler, daemon, timer, cron entry, or supervisor calling the entrypoint periodically, queued GitHub Issues remain queued until a human triggers the runner from SSH, Termux, or another manual path.

The stale PID file and old daemon log indicate a stopped `nohup` loop rather than a healthy persistent service:

```text
pid_file=56405
no active process for that PID
last yellow tick=2026-05-02 08:05:20 UTC
diagnostic time=2026-05-02 18:40:04 UTC
```

## Smallest Safe Restore Option

The smallest safe restore option for a later approved live task is to restore one supervised YELLOW docs-compatible polling loop that calls the existing single-task entrypoint once per interval, under a single-instance lock, with durable logs and no merge/deploy/secrets behavior.

Recommended later live mechanism:

```text
systemd user service + systemd user timer
```

Reason:

```text
- A timer is easier to inspect and rollback than an unowned nohup process.
- It avoids relying on a long-lived SSH shell.
- It can run one bounded loop iteration and exit, reducing hidden daemon state.
- It can preserve the existing agent-run-next-yellow safety model.
```

Fallback if user-systemd is unavailable after live inspection:

```text
supervised nohup loop using the existing agent-yellow-daemon-start pattern, but only after explicit user approval
```

Do not enable either path in this task.

## Exact Proposed Names And Commands

Preferred later live unit names:

```text
agent-yellow-loop.service
agent-yellow-loop.timer
```

Preferred later live command executed by the service:

```text
/usr/bin/flock -n /home/agent/agent-dev/.agent-yellow-autoloop.lock /home/agent/agent-dev/bin/agent-run-yellow-loop 1
```

Alternative command with direct single-task entrypoint:

```text
/usr/bin/flock -n /home/agent/agent-dev/.agent-yellow-autoloop.lock /home/agent/agent-dev/bin/agent-run-next-yellow
```

Preferred timer cadence for later approval:

```text
OnBootSec=2min
OnUnitInactiveSec=10min
RandomizedDelaySec=60s
```

Read-only status command names proposed for source-controlled operator docs:

```text
agent-dept-autoloop-status
agent-dept-autoloop-dry-run
```

Those scripts were not created in this task because the implementation instruction narrowed the change to markdown files under `projects/jeeves/`. Existing source-controlled dry-run helpers already exist under `scripts/agent-dept/`, and adding more scripts would expand the current docs-only request.

## Lock And Concurrency Guard Plan

Keep the existing per-task runner lock:

```text
/home/agent/agent-dev/.agent-runner.lock
```

Add a separate outer autoloop lock for the scheduler wrapper:

```text
/home/agent/agent-dev/.agent-yellow-autoloop.lock
```

Required behavior:

```text
- one timer invocation at a time
- one runner claim per loop iteration
- batch size 1 for YELLOW autonomous polling
- exit cleanly if the lock is busy
- never run parallel YELLOW issue claims from the same host
- never clear a lock automatically unless a later reviewed task proves it is stale and the user approves
```

This preserves the existing `flock` guard inside `agent-run-next-yellow` while adding a guard around the scheduler itself.

## Log Path Plan

Durable service logs should go to both journald and a stable file path.

Proposed file paths:

```text
/home/agent/agent-dev/logs/agent-yellow-autoloop.log
/home/agent/agent-dev/logs/agent-yellow-autoloop.err
/home/agent/agent-dev/logs/agent-yellow-daemon.out
/home/agent/agent-dev/agent-runs/<run-id>/
```

Required log contents:

```text
- timestamp UTC
- hostname
- unit or command name
- lock acquisition result
- exact entrypoint called
- issue selected or NO_YELLOW_TASK
- YELLOW_RUNNER_BUSY result when applicable
- report issue or draft PR URL when created by the existing runner
- nonzero exit status when blocked or failed
```

Do not log secret values, environment values, tokens, SSH keys, or full auth configuration.

## Failure And Stale-Claim Behavior

Allowed automatic behavior:

```text
- If no eligible issue exists, exit 0.
- If the lock is busy, exit 0 and log busy.
- If agent-run-next-yellow returns NO_YELLOW_TASK, exit 0.
- If agent-run-next-yellow returns YELLOW_RUNNER_BUSY, exit 0.
- If a task is blocked by normal runner logic, let the existing runner create its blocked report and labels.
```

Required manual-review behavior:

```text
- Report stale claims; do not destructively clear them.
- Report stale PID files; do not kill unknown processes from the timer.
- Report lock conflicts; do not remove lock files automatically.
- Leave RED tasks untouched.
- Leave secrets, deploys, repository permissions, and merge decisions untouched.
```

Known existing YELLOW interrupted behavior:

```text
agent-run-next-yellow has an INT/TERM trap that comments on the task, removes agent:running, and adds agent:stale.
```

Known existing blocked behavior:

```text
agent-run-next-yellow creates an [agent-blocked] report, removes agent:claimed and agent:running, and adds agent:blocked.
```

A later restore task should not broaden this behavior. Stale claim cleanup must remain reporting-only unless ChatGPT reviews the exact claim and the user approves cleanup.

## Rollback Plan

Rollback for a later approved live enablement:

```text
1. Disable the timer only after confirming no runner task is mid-claim or mid-edit.
2. Stop future timer invocations.
3. Confirm no active agent-run-next-yellow, agent-run-yellow-loop, or agent-run-yellow-daemon process is running.
4. Leave existing draft PRs, report issues, branches, and run directories intact.
5. Do not clear agent:claimed, agent:running, agent:stale, or lock state automatically.
6. Record the rollback reason in the relevant GitHub Issue or Jeeves handoff doc.
7. If needed, return to manual invocation of /home/agent/agent-dev/bin/agent-run-next-yellow.
```

Exact later rollback commands require live approval and are not executed here. Candidate names only:

```text
systemctl --user disable --now agent-yellow-loop.timer
systemctl --user status agent-yellow-loop.service agent-yellow-loop.timer
```

## What Requires Explicit User Approval Before Live Enablement

The following require explicit user approval in a later task:

```text
- creating any systemd unit file
- enabling or starting any systemd service or timer
- starting any nohup daemon
- stopping or killing any current runner process
- clearing stale PID files or locks
- editing /home/agent/agent-dev/bin/agent-run-next-yellow
- editing /home/agent/agent-dev/bin/agent-run-next-green
- editing /home/agent/agent-dev/bin/agent-yellow-setup
- changing GitHub labels beyond a claimed task's existing runner behavior
- changing secrets, SSH keys, tokens, env files, GitHub permissions, or repository settings
- enabling auto-merge, deploy, RED execution, or self-approval behavior
```

ChatGPT review remains required before live service, timer, or daemon enablement. The user remains the final approver.

## Risks

```text
- systemctl and crontab inspection were blocked, so hidden scheduler state cannot be fully ruled out from this environment.
- The current nohup helper uses pkill -f before starting; that is too broad for unattended restore unless reviewed.
- The current PID file is stale and could mislead operators unless status scripts check the process.
- Backup runner copies in /home/agent/agent-dev/bin increase drift and audit confusion.
- A direct long-running nohup loop can silently die again after logout, reboot, or host process cleanup.
- A timer that calls the wrong wrapper could duplicate claims unless protected by flock and batch size 1.
- Any live enablement is runner infrastructure work and should remain ChatGPT-reviewed and user-approved.
```

## Validation

Planned validation after this file change:

```text
git diff --check
```

`bash -n scripts/agent-dept/agent-dept-autoloop-dry-run scripts/agent-dept/agent-dept-autoloop-status` was not applicable because those optional scripts were not created. They were not created because this controlled run was explicitly narrowed to markdown files under `projects/jeeves/`, and existing `scripts/agent-dept/` dry-run/status helpers already exist for source-controlled read-only previews.

## Conclusion

An autonomous YELLOW loop likely existed as a host-side `nohup` daemon started by `agent-yellow-daemon-start`. It is currently not running, and its PID file appears stale. The issue picker and safety model still exist, so manual SSH or Termux pushes are needed because no active autonomous scheduler is presently visible calling the runner.

The safest restore plan is a later approved systemd user timer that runs exactly one YELLOW loop iteration with `flock`, durable logs, no auto-merge, no deploy, no secrets, no RED execution, and reporting-only stale-claim handling.
