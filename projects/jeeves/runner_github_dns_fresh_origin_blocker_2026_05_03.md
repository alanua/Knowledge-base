# Jeeves Runner GitHub DNS Fresh-Origin Blocker - 2026-05-03

## Status

Diagnostics completed from the current YELLOW runner workspace.

No fix was attempted. The implementation instruction for this task explicitly forbids starting, stopping, enabling, restarting, or creating services, so the optional resolver restart/cache refresh path was not used.

## Scope

Jeeves runner infrastructure diagnostics for the development department fresh-origin gate.

This report is docs-only and limited to the requested GitHub DNS / fresh-origin blocker diagnosis for:

```text
fatal: unable to access 'https://github.com/alanua/Knowledge-base.git/': Could not resolve host: github.com
```

## Source Relationship

This extends:

- issue #147 - fresh-origin smoke gate task
- PR #148 - evidence report showing wrapper validation passed locally but fresh-origin gate failed
- issue #149 - runner report for #147
- issue #146 - handoff anchor

This is not a development department expansion task.
This is not a runner authority expansion task.
This is a narrow diagnostics task to explain why the Hetzner runner environment could not resolve or reach `github.com` during the fresh-origin gate.

## Diagnosis Summary

The blocker reproduced in this execution context. `curl` and `git ls-remote` both failed because `github.com` could not be resolved.

The strongest observed signal is runner/container environment isolation or sandbox networking restriction, not a GitHub repository, credential, proxy, or normal GitHub service outage:

- `/etc/resolv.conf` points clients to the local `systemd-resolved` stub resolver at `127.0.0.53`.
- `resolvectl status` could not query system resolver state because opening the system bus was not permitted.
- DNS tools failed before returning records because sockets could not be opened.
- `ip route` and `ip addr` could not inspect networking because opening a netlink socket was not permitted.
- No proxy environment variables were present in the redacted proxy-var check.
- HTTPS tests failed at DNS resolution, before TLS, HTTP, authentication, or repository authorization could be tested.

Root cause is therefore best classified as environment-level network/socket isolation affecting DNS and network inspection in the runner execution context. This report does not prove whether the isolation is imposed by the runner wrapper, container sandbox, host policy, or another execution boundary.

## Commands Run and Results

Command block run from `/home/agent/agent-dev/repos/Knowledge-base`:

```bash
set -u

date -u
hostname -f || hostname
pwd
whoami

echo '== resolver config =='
cat /etc/resolv.conf || true

if command -v systemd-resolve >/dev/null 2>&1; then
  systemd-resolve --status || true
fi
if command -v resolvectl >/dev/null 2>&1; then
  resolvectl status || true
fi

echo '== DNS tests =='
getent hosts github.com || true
getent ahosts github.com || true
nslookup github.com || true
dig github.com || true

echo '== network route =='
ip route || true
ip addr || true

if command -v curl >/dev/null 2>&1; then
  echo '== HTTPS tests =='
  curl -I --max-time 10 https://github.com || true
  curl -I --max-time 10 https://api.github.com || true
fi

echo '== git remote test =='
git ls-remote https://github.com/alanua/Knowledge-base.git HEAD || true

echo '== environment proxy vars redacted =='
env | grep -Ei '^(http_proxy|https_proxy|no_proxy|all_proxy)=' | sed -E 's#=.*#=<set>#' || true
```

Identity and workspace:

```text
Sun May  3 19:27:06 UTC 2026
hetzner-agent-runner-1
/home/agent/agent-dev/repos/Knowledge-base
agent
```

Resolver configuration:

```text
/etc/resolv.conf is the systemd-resolved stub resolv.conf.
nameserver 127.0.0.53
options edns0 trust-ad
search .
```

Resolver status:

```text
resolvectl status:
sd_bus_open_system: Operation not permitted
```

DNS tests:

```text
getent hosts github.com:
no output

getent ahosts github.com:
no output

nslookup github.com:
net.c:137:try_proto(): socket(): Operation not permitted (1)
net.c:137:try_proto(): socket(): Operation not permitted (1)
(null): can't find either v4 or v6 networking

dig github.com:
net.c:137:try_proto(): socket(): Operation not permitted (1)
net.c:137:try_proto(): socket(): Operation not permitted (1)
dig: can't find either v4 or v6 networking
```

Network route and address inspection:

```text
ip route:
Cannot open netlink socket: Operation not permitted

ip addr:
Cannot open netlink socket: Operation not permitted
```

HTTPS tests:

```text
curl -I --max-time 10 https://github.com:
curl: (6) Could not resolve host: github.com

curl -I --max-time 10 https://api.github.com:
curl: (6) Could not resolve host: api.github.com
```

Git remote test:

```text
git ls-remote https://github.com/alanua/Knowledge-base.git HEAD:
fatal: unable to access 'https://github.com/alanua/Knowledge-base.git/': Could not resolve host: github.com
```

Proxy environment variables:

```text
No http_proxy, https_proxy, no_proxy, or all_proxy entries were printed by the redacted proxy-var check.
```

## Current DNS Status

`github.com` DNS does not work in this execution context.

Observed result:

```text
getent hosts github.com: no output
curl: (6) Could not resolve host: github.com
```

## Current GitHub Remote Status

`git ls-remote` does not work in this execution context.

Observed result:

```text
fatal: unable to access 'https://github.com/alanua/Knowledge-base.git/': Could not resolve host: github.com
```

## Can Issue #147 Be Rerun

Issue #147 should not be rerun from the same constrained execution context until DNS/network socket access is restored or the fresh-origin gate is moved to an environment that can resolve and reach `github.com`.

The wrapper validation from PR #148 may remain locally meaningful, but the fresh-origin gate still cannot prove a fresh clone/fetch while `github.com` resolution fails.

## Fix Attempted

No fix was attempted.

Reason:

- The issue body allowed an optional low-risk resolver/cache restart only if obvious and safe.
- The implementation instruction for this controlled YELLOW task explicitly forbids starting, stopping, enabling, restarting, or creating services.
- The observed failures also include socket and netlink permission errors, so a resolver restart alone would not be proven sufficient from inside this context.

## What Was Not Changed

No live runner scripts were edited.
No files under `~/agent-dev/bin/` were edited.
No services were started, stopped, enabled, restarted, or created.
No systemd units were created.
No firewall or network policy changes were made.
No secrets, SSH keys, tokens, GitHub credentials, environment secrets, or repository settings were touched.
No production systems or deployment paths were touched.
No live department expansion was run.
No automatic rerun of the fresh-origin gate was triggered.
No commit, push, merge, deploy, or PR creation was performed by this diagnostics step.

## Remaining Risk

The exact boundary imposing the socket restrictions is not identified by these read-only diagnostics. Candidate causes remain:

- runner wrapper sandboxing;
- container runtime network isolation;
- host-level policy applied to the runner process;
- restricted capabilities preventing network and netlink socket access;
- system resolver or network namespace state that cannot be inspected from this context.

Because `ip route`, `ip addr`, DNS clients, and `resolvectl` were blocked by permission errors, a host-side diagnostic outside this constrained execution context is needed to distinguish host DNS failure from runner/container isolation.

## Validation

Validation requested:

```bash
git diff --check
```

Result:

```text
exit_code=0
stdout/stderr: none
```
