# Agent Host Wrapper Reference

Status: inert reference material only
Scope: YELLOW host wrapper source-control normalization

These files are source-controlled reference material for the YELLOW host wrapper
family. They are not installed automatically, are not executable entry points,
and are not a live runner implementation.

This directory does not authorize live edits to:

```text
/home/agent/agent-dev/bin/*
```

Any future live apply to host-local wrapper files requires a separate explicit
approval. That approval must name the live target files, the intended patch, and
the validation to run after apply.

Future fresh-origin gate implementation must be reviewed in source control
before any host apply. The reviewed implementation should cover the gate
insertion point, metadata handoff, setup-carrier sync, dirty-worktree policy,
and privacy boundaries before a manual host-local apply task is considered.

## Source Inputs

The reference files follow these source-controlled reports:

```text
projects/jeeves/host_wrapper_fresh_origin_gate_design_2026_05_03.md
projects/jeeves/host_wrapper_fresh_origin_gate_insertion_point_2026_05_03.md
projects/jeeves/yellow_host_wrapper_source_control_normalization_2026_05_03.md
```

The host-local wrapper family was inspected only through the bounded,
public-safe ranges allowed by the task:

```text
/home/agent/agent-dev/bin/agent-run-yellow-loop
/home/agent/agent-dev/bin/agent-run-next-yellow
/home/agent/agent-dev/bin/agent-yellow-setup
```

No env files, token files, SSH configs, credential helper output, broad host
inventory, repo settings, service state, private logs, deployment paths, or
secret material were read or copied into these references.

## Redaction And Abstraction

The `.reference.sh` files are abstracted comment-only references. They preserve
public-safe structure and insertion-point guidance while omitting executable
runner behavior. They intentionally do not include a working installer, live
apply script, systemd unit, service command, credential output, token, SSH key,
env value, private host inventory, repo setting, broad log, or deployment
secret.

## Non-Authorization

These files do not authorize:

- installing, copying, symlinking, or chmodding host scripts;
- editing `/home/agent/agent-dev/bin/*`;
- starting, stopping, enabling, restarting, or creating services;
- rerunning issue #147 automatically;
- expanding runner authority;
- expanding the live development department;
- changing Jeeves runtime behavior;
- merging, deploying, or touching production systems.

## Next Recommendation

Prepare a reviewed fresh-origin gate reference implementation in source control
or create a separate explicit manual host apply task. ChatGPT review and user
approval remain required before any live host edit.
