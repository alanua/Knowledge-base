# -----------------------------------------------------------------------------
# INERT REFERENCE ONLY - DO NOT INSTALL OR EXECUTE
# -----------------------------------------------------------------------------
#
# Reference target:
#   agent-run-yellow-loop
#
# Source relationship:
#   This comment-only reference summarizes the public-safe structure observed in
#   the bounded host-side read allowed by the YELLOW source-control
#   normalization task.
#
# Redaction/abstraction:
#   No live host script was copied verbatim. This file omits executable shell,
#   host mutation, service control, secrets, env values, credential material,
#   private inventory, and broad logs.
#
# Structural outline:
#
#   - read an optional batch count, defaulting to one task
#   - for each batch slot, invoke the next-task YELLOW wrapper
#   - print child output for operator visibility
#   - stop cleanly when the next-task wrapper reports no queued YELLOW task
#   - stop cleanly when the next-task wrapper reports runner lock contention
#   - print a loop-complete marker after the requested batch count
#
# Fresh-origin relevance:
#
#   This loop wrapper is not the fresh-origin gate insertion point. It delegates
#   repository preparation and Codex sandbox startup to the next-task wrapper.
#
# Non-authorization:
#
#   This reference must not be installed, executed, chmodded executable, copied
#   over /home/agent/agent-dev/bin/*, or used as authority for a live host edit.
