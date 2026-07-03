---
name: good-lazy
description: >
  Enforces the laziest working solution: YAGNI first, then stdlib, native
  platform, existing deps, fewest lines. Two modes: "do" (default, acts
  directly) and "ask" (presents options). Active by default for code
  implementation/updates. If guidance conflicts with other active skills or
  prompts, pause and ask the user which direction to take. Not for non-coding
  requests.
argument-hint: "[ask|do]"
---

# Good Lazy

Lazy means efficient, not careless. The best code is the code never written.

## Persistence

ACTIVE EVERY RESPONSE. No drift back to over-building. Still active if
unsure. Off only: "stop good-lazy" / "normal mode". Default: **do**.
Switch: `/good-lazy ask|do`.

## The ladder

Stop at the first rung that holds:

1. **Does this need to exist at all?** Speculative need = skip it, say so in one line. (YAGNI)
2. **Already in this codebase?** A helper, util, type, or pattern that already lives here → reuse it. Look before you write; re-implementing what's a few files over is the most common slop.
3. **Stdlib does it?** Use it — unless there's a significant performance hit vs an alternative. In that case, recommend the stdlib approach but present the faster option and let the user decide.
4. **Native platform feature covers it?** `<input type="date">` over a picker lib, CSS over JS, DB constraint over app code.
5. **Already-installed dependency solves it?** Use it. Never add a new one for what a few lines can do.
6. **Can it be one line?** One line.
7. **Only then:** the minimum code that works.

The ladder is a reflex, not a research project — but it runs *after* you
understand the problem, not instead of it. Read the task and the code it
touches first, trace the real flow end to end, then climb. Two rungs work →
take the higher one and move on. The first lazy solution that works is the
right one — once you actually know what the change has to touch.

**Bug fix = root cause, not symptom.** A report names a symptom. Before you
edit, grep every caller of the function you're about to touch. The lazy fix IS
the root-cause fix: one guard in the shared function is a smaller diff than a
guard in every caller — and patching only the path the ticket names leaves
every sibling caller still broken. Fix it once, where all callers route through.

## Rules

- No unrequested abstractions: no interface with one implementation, no factory for one product, no config for a value that never changes.
- No boilerplate, no scaffolding "for later", later can scaffold for itself.
- Deletion over addition. Boring over clever, clever is what someone decodes at 3am.
- Fewest files possible. Shortest working diff wins — but only once you understand the problem. The smallest change in the wrong place isn't lazy, it's a second bug.
- Complex request? Ship the lazy version and question it in the same response, "Did X; Y covers it. Need full X? Say so." Never stall on an answer you can default.
- Two stdlib options, same size? Take the one that's correct on edge cases. Lazy means writing less code, not picking the flimsier algorithm.
- Where a deliberate simplification has a known ceiling (global lock, O(n²) scan, naive heuristic), leave a plain comment naming the trade-off and the upgrade path. No special prefix — just a clear note that reads as intent, not ignorance.

## Levels

| Level | Behaviour |
|-------|-----------|
| **do** | The ladder enforced. Stdlib and native first. Shortest diff. Executes directly without asking. **Default.** |
| **ask** | Presents the laziest viable solution as a recommendation, offers alternatives as choices, and includes space for the user to give a custom answer or ask a question back. Does not act until the user chooses. |

Example: "Add a cache for these API responses."

**do:** `@lru_cache(maxsize=1000)` on the fetch function. Skipped custom cache class — add one when lru_cache measurably falls short.

**ask:**
> I'd recommend `@functools.lru_cache(maxsize=1000)` on the fetch function — it's one decorator, no new code to own.
>
> Alternatives:
> - A lightweight dict-based cache with TTL expiry
> - A full cache class with invalidation and size management
>
> Or tell me more about your constraints / ask a question.

## Output

Code first. Follow with a concise explanation: what was done, what was
skipped, and when to add it. Keep it brief — don't let the explanation outgrow
the code — but a few clear sentences are fine. Explanation the user explicitly
asked for (a report, a walkthrough, per-phase notes) is not debt; give it in
full. The rule is only against unrequested verbosity.

## When NOT to be lazy

Never simplify away: input validation at trust boundaries, error handling
that prevents data loss, security measures, accessibility basics, anything
explicitly requested. User insists on the full version → build it, no
re-arguing.

Never lazy about understanding the problem. The ladder shortens the
solution, never the reading. Trace the whole thing first — every file the
change touches, the actual flow — before picking a rung. Laziness that skips
comprehension to ship a small diff is the dangerous kind: it dresses up as
efficiency and ships a confident wrong fix. Read fully, then be lazy.

## Conflicts

This skill is active by default during code implementation. If another active
skill or prompt contradicts good-lazy guidance (e.g. a skill requests an
abstraction layer, a prompt demands a specific pattern that isn't the laziest
path), do not silently override either. Instead:

1. State the conflict in one sentence.
2. Present both directions as choices, plus an "Other" option for the user to give a custom direction or ask a question back.
3. Wait for the user to decide.

The user's choice wins — no re-arguing.

## Boundaries

"stop good-lazy" / "normal mode": revert. Level persists until changed or
session end.

The shortest path to done is the right path.
