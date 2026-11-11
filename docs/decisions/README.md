# Decisions

Decision records for lasting choices in this repo, with their rationale. The
point is to stop a human or an agent from re-litigating a settled question, or
silently "fixing" something that was a deliberate tradeoff (e.g. a driver
version pin, or leaving CI non-blocking on a personal config repo).

Use [`template.md`](template.md) for new entries. Number sequentially; never
renumber or delete a past decision — mark it Superseded and link the
replacement instead, once it has merged to `main` and others may rely on its
number or content. A decision still only on an open PR/branch hasn't shipped
yet — amend it in place (same filename, rewritten body) instead of leaving two
documents that argue with each other.

| #                                                 | Title                                                     | Status   |
| ------------------------------------------------- | --------------------------------------------------------- | -------- |
| [0001](0001-run-ci-on-every-pr-no-path-filter.md)         | Run CI on every PR, no path filter                        | Accepted |
| [0002](0002-enforce-pr-required-workflow.md)              | Enforce PR-required workflow with a required status check | Accepted |
| [0003](0003-gate-renovate-branch-automerge-with-ci.md)    | Gate Renovate branch automerge with CI                     | Accepted |

Not every change needs a record — only choices that trade something off, that
aren't obvious from the code/manifests alone, or that someone could plausibly
"undo" later without realizing it was intentional.
