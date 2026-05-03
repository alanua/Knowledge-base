# -----------------------------------------------------------------------------
# INERT REFERENCE ONLY - DO NOT INSTALL OR EXECUTE
# -----------------------------------------------------------------------------
#
# Reference target:
#   agent-run-next-yellow
#
# Source relationship:
#   This comment-only reference summarizes the public-safe structure observed in
#   the bounded host-side read allowed by the YELLOW source-control
#   normalization task and the prior source-controlled design reports.
#
# Redaction/abstraction:
#   No live host script was copied verbatim. This file omits executable shell,
#   host mutation, service control, secrets, env values, credential material,
#   private inventory, broad logs, repo settings, and deployment details.
#
# Public-safe structural outline:
#
#   - select host or local runner labels from the current host identity
#   - create a per-run artifact directory
#   - use a lock to avoid concurrent YELLOW runner execution
#   - search configured GitHub repositories for open queued YELLOW tasks
#   - record the issue body into the run directory
#   - best-effort mark the issue claimed/running and post a start comment
#   - map supported repository names to local checkout paths
#   - prepare a task branch
#   - construct a controlled YELLOW Codex prompt from:
#       * absolute runner rules
#       * explicit allowed files
#       * issue body
#       * route-specific implementation instruction
#   - start Codex with the selected repository checkout
#   - remove transient Codex/FETCH_HEAD artifacts after Codex returns
#   - reject direct Codex-created commits before validation/commit
#   - collect changed files and validate them against route-specific allowlists
#   - run route-specific validation
#   - create a draft PR after validation in the live wrapper path
#
# Current Knowledge-base lane:docs flow, summarized:
#
#   run_kb_yellow_generic_docs_lane()
#     -> prepare_branch(repo_dir, branch)
#     -> run_codex_yellow(repo_dir, allowed_text, task_text)
#     -> ensure_no_codex_commit()
#     -> changed_files()
#     -> validate_allowed_files(...)
#     -> validate_kb()
#     -> create_draft_pr(...)
#
# Fresh-origin gate insertion point for future reviewed implementation:
#
#   Function:
#     prepare_branch()
#
#   Boundary:
#     after entering the repository checkout and before switching/pulling main,
#     cleaning transient files, checking dirty state, or creating the task branch
#
#   Reviewed helper responsibilities:
#     - verify expected repository identity and origin URL
#     - fetch or update origin/main from host context
#     - update only by fast-forward
#     - record host freshness timestamp
#     - record verified HEAD SHA
#     - record clean/dirty state without exposing private data
#     - fail closed on malformed or missing freshness metadata
#     - fail closed on dirty state unless a later reviewed exception exists
#
# Metadata handoff insertion point for future reviewed implementation:
#
#   Function:
#     run_codex_yellow()
#
#   Boundary:
#     before Codex starts, include minimal host freshness metadata in the prompt
#     or run context so Codex can compare local HEAD with the host-verified SHA
#
# Minimal public-safe metadata fields for a future reviewed implementation:
#
#   repository=alanua/Knowledge-base
#   remote_url=https://github.com/alanua/Knowledge-base.git
#   branch=main
#   host_freshness_checked_at_utc=<ISO-8601 timestamp>
#   host_freshness_command_set=fetch_plus_ff_only_update
#   host_verified_head_sha=<40-character commit SHA>
#   host_worktree_clean=yes|no
#   host_status_short_allowed_entries=<integer>
#   host_status_short_allowed_paths=<empty or reviewed public-safe path list>
#   host_update_mode=existing_checkout
#   runner_lane=lane:docs
#   risk=risk:yellow
#   source_issue=<issue number>
#
# Privacy and safety boundaries:
#
#   - do not print tokens, SSH keys, env values, credential helper output, repo
#     settings, broad logs, private host inventory, or deployment secrets
#   - do not perform broad host diagnostics
#   - do not change firewall, network, container, service, or systemd state
#   - do not rerun issue #147 automatically
#   - do not expand runner authority or live development department behavior
#
# Non-authorization:
#
#   This reference must not be installed, executed, chmodded executable, copied
#   over /home/agent/agent-dev/bin/*, or used as authority for a live host edit.
