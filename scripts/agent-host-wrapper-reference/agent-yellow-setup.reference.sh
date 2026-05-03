# -----------------------------------------------------------------------------
# INERT REFERENCE ONLY - DO NOT INSTALL OR EXECUTE
# -----------------------------------------------------------------------------
#
# Reference target:
#   agent-yellow-setup
#
# Source relationship:
#   This comment-only reference summarizes the public-safe setup-carrier role
#   observed in the bounded host-side read allowed by the YELLOW source-control
#   normalization task.
#
# Redaction/abstraction:
#   No live host setup script was copied verbatim. This file omits executable
#   shell, heredoc installer content, host mutation, service control, secrets,
#   env values, credential material, private inventory, broad logs, repo
#   settings, and deployment details.
#
# Public-safe structural outline:
#
#   - create host-local runner support directories
#   - choose host-local or local-WSL wrapper command names from host identity
#   - define runner log and PID file paths for the selected mode
#   - write the next-task wrapper from a template/heredoc
#   - write the loop wrapper from a template/heredoc
#   - write daemon/start/status/stop helper wrappers in the live setup path
#
# Fresh-origin relevance:
#
#   The setup carrier can recreate the next-task wrapper. Any future reviewed
#   change to the live next-task wrapper must therefore be mirrored in the setup
#   carrier before host apply, otherwise setup/reinstall can restore an older
#   wrapper without the reviewed gate.
#
# Future reviewed implementation checklist:
#
#   - keep setup-carrier content synchronized with the reviewed
#     agent-run-next-yellow fresh-origin gate implementation
#   - keep generated scripts privacy-bounded
#   - keep host freshness metadata minimal and public-safe
#   - fail closed if repository freshness cannot be proven
#   - avoid service changes unless a separate explicit task approves them
#
# Non-authorization:
#
#   This reference must not be installed, executed, chmodded executable, copied
#   over /home/agent/agent-dev/bin/*, or used as authority for a live host edit.
