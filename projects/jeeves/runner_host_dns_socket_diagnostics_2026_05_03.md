# Runner Host DNS Socket Diagnostics - 2026-05-03

Date: 2026-05-03
Repository: `alanua/Knowledge-base`
Task: GitHub issue `#160`
Lane: controlled `lane:docs` `risk:yellow`

## Status

Host-side diagnosis requested, but not completed from a proven host shell.

The diagnostics were executed from the shell available to this YELLOW task. That
shell still showed the same DNS, socket, netlink, and system bus restrictions
previously observed inside the constrained runner execution context. Because the
available shell appears constrained, this report does not prove whether the
Hetzner host itself can resolve or reach GitHub outside the runner sandbox.

## Scope

This is ChatGPT exoskeleton runner infrastructure diagnostics only.

This is not Jeeves runtime work. This is not development department expansion.
No live runner scripts, service units, Docker or Podman network settings,
firewall rules, credentials, deployment paths, or production runtime behavior
were changed.

## Source Relationship

This follows:

- issue `#151` - constrained runner-context diagnostics
- issue `#158` - report confirming `github.com` DNS/socket/netlink failures
  inside the runner execution context
- PR `#157` - docs-only evidence report for the blocker
- issue `#146` - handoff anchor

PR `#157` / issue `#158` showed that inside the YELLOW runner execution
context:

```text
github.com DNS does not resolve
DNS tools cannot open sockets
ip route / ip addr cannot open netlink sockets
resolvectl cannot access the system bus
```

The same class of failure was reproduced from the shell available for this
task, so the requested host-side distinction remains unresolved.

## Diagnostics Performed

Read-only diagnostics were run with the requested command set:

- `date -u`
- `hostname -f || hostname`
- `whoami`
- `pwd`
- `cat /etc/resolv.conf || true`
- `resolvectl status || true`
- `systemctl status systemd-resolved --no-pager || true`
- `getent hosts github.com || true`
- `getent ahosts github.com || true`
- `nslookup github.com || true`
- `dig github.com || true`
- `ip route || true`
- `ip addr || true`
- `curl -I --max-time 10 https://github.com || true`
- `curl -I --max-time 10 https://api.github.com || true`
- `git ls-remote https://github.com/alanua/Knowledge-base.git HEAD || true`
- runner process and container clue commands using `ps`, `systemctl`, `docker
  ps`, and `podman ps`

Observed execution identity:

```text
date_utc=Sun May  3 19:49:20 UTC 2026
hostname=hetzner-agent-runner-1
whoami=agent
pwd=/home/agent/agent-dev/repos/Knowledge-base
```

## Host Resolver Config

`/etc/resolv.conf` was readable and points at the local `systemd-resolved` stub:

```text
nameserver 127.0.0.53
options edns0 trust-ad
search .
```

`resolvectl status` failed:

```text
sd_bus_open_system: Operation not permitted
```

`systemctl status systemd-resolved --no-pager` failed:

```text
Failed to connect to bus: Operation not permitted
```

## Host DNS Result

DNS resolution for `github.com` did not succeed from the available shell.

Observed failures included:

```text
socket(): Operation not permitted
can't find either v4 or v6 networking
dig: can't find either v4 or v6 networking
```

Because the DNS tools could not open sockets, this result is evidence that the
available shell remains network-constrained. It is not evidence that DNS is
broken host-wide on the Hetzner host.

## Host Network Route Result

`ip route` and `ip addr` both failed:

```text
Cannot open netlink socket: Operation not permitted
```

This matches the earlier runner-context blocker and indicates that the available
diagnostic shell could not inspect network state through netlink.

## Host GitHub HTTPS Result

HTTPS probes did not reach GitHub from the available shell.

Observed results:

```text
curl: (6) Could not resolve host: github.com
curl: (6) Could not resolve host: api.github.com
```

This does not prove GitHub HTTPS is unreachable from the host. It proves only
that the available shell could not resolve the hostnames before attempting the
HTTPS connections.

## Host Git Remote Result

The read-only Git remote probe failed before reaching the remote:

```text
fatal: unable to access 'https://github.com/alanua/Knowledge-base.git/': Could not resolve host: github.com
```

This is consistent with DNS/socket restriction in the available shell.

## Host-Wide Or Sandbox-Only Assessment

Assessment: unresolved, leaning sandbox-only but not proven.

The diagnostics were intended to run outside the constrained runner execution
context. The observed failures are the same failures already attributed to the
runner sandbox/container/wrapper context:

- DNS tools cannot open sockets.
- `ip route` and `ip addr` cannot open netlink sockets.
- `resolvectl` and `systemctl` cannot access the system bus.
- `curl` and `git ls-remote` fail because `github.com` cannot be resolved.

Because the available shell still appears constrained, this task could not
differentiate a host-wide GitHub/DNS outage from a sandbox-only restriction.

## Runner And Container Clues

The process clue command did not reveal a broader runner process list from this
context. The only matching unredacted process line observed was the diagnostic
`ps auxww` invocation itself.

`systemctl --user list-units --all` failed:

```text
Failed to connect to bus: No medium found
```

`systemctl list-units --all` failed:

```text
Failed to connect to bus: Operation not permitted
```

The `docker ps` and `podman ps` clue commands returned no visible matching
container rows from this context. No `docker inspect` or `podman inspect` command
was run because no container name was identified from the safe read-only listing
output.

No environment variables, secrets, tokens, SSH keys, GitHub credentials, or
repository settings were included in this report.

## What Was Not Changed

No changes were made to:

- live Hetzner runner scripts
- `~/agent-dev/bin/*`
- service, timer, daemon, or systemd unit state
- Docker or Podman network configuration
- firewall or network policy
- credentials, secrets, SSH keys, tokens, or environment values
- deployment paths
- production runtime behavior
- GitHub repository settings

No service was started, stopped, enabled, restarted, or created.

No fresh-origin gate was automatically rerun.

No commit, push, merge, deploy, or PR creation was performed by this task.

## Remaining Risk

The main remaining risk is diagnostic ambiguity. The shell available to this
task appears to be the same or a similarly constrained execution context as the
original YELLOW runner. Therefore the report cannot confirm whether the Hetzner
host itself has working DNS and GitHub HTTPS access.

A later operator may incorrectly treat this as host-wide failure evidence. The
safer interpretation is that this task reproduced the constrained-context
failure and failed to obtain a less-constrained host-side view.

## Next Recommended Task

Run the same read-only diagnostic block from an explicitly confirmed
less-constrained host shell, such as an interactive Hetzner host login outside
the runner sandbox/container/wrapper. The output should be summarized without
secrets and compared against this report to answer:

- whether the host can resolve `github.com`
- whether the host can reach `https://github.com` and `https://api.github.com`
- whether `git ls-remote https://github.com/alanua/Knowledge-base.git HEAD`
  succeeds
- which wrapper, container, sandbox, or host policy prevents sockets, netlink,
  and system bus access inside the YELLOW runner context

Any fix should remain a separate ChatGPT-reviewed task. It should not expand
runner authority, change service state, edit runner scripts, alter Docker or
Podman networking, touch credentials, or rerun fresh-origin validation without
explicit approval.
