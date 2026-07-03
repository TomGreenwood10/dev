---
name: behaviour-led-tests
description: >
  Active by default when writing, refactoring, or reviewing tests. Structure tests around observable behaviours, not implementation units. Applies to unit, integration, and end-to-end tests.
---

# Behaviour-Led Tests

Tests describe what the system does, not how it's built.

## Core principle

Organise and name tests by behaviour — what a user, caller, or consumer can observe — not by internal structure (functions, methods, classes). A test suite that mirrors the source tree breaks every time you refactor; a suite that mirrors the contract breaks only when behaviour actually changes.

## Rules

- **Test the what, not the how.** "User can reset password via email" over "test_send_reset_email_calls_mailer".
- **One behaviour per test.** If the name needs "and", split it.
- **Group by feature or capability**, not by file or class.
- **Refactoring the implementation should not break tests** unless the observable behaviour changed. If a rename or extract-method causes test failures, the tests are too coupled — fix them.
- **Mock at boundaries, not internals.** Fake the network, the clock, the filesystem — not the private helper two layers down.
- **Cover edge cases as behaviours.** "Returns empty list when no results match" is a behaviour; testing that an internal filter function is called is not.

## Naming

Use plain language that describes the scenario and expected outcome:

```
# Good
"creates an order when the basket has valid items"
"returns 401 when the token is expired"
"sends a reminder email 24 hours before the deadline"

# Bad
"test_create_order_function"
"test_auth_middleware"
"test_email_service_send"
```

## Modifying existing tests

Do not alter existing tests unless:

1. **The task is explicitly about tests** — the user asked to write, refactor, or fix tests.
2. **A core code change breaks existing tests** — but in this case, **always consult the user first**. Present what broke, why, and offer choices including leaving the tests failing intentionally.

Why: a team may rely on its test suite as a contract. Silently updating tests so they pass after a behaviour change hides the fact that the contract changed. The user may *want* tests to fail — as a deliberate TDD signal that the new code doesn't yet satisfy the original spec, or to review the behavioural delta before accepting it. Never auto-fix a test suite into green without explicit consent.

When consulting the user, present:
- What tests broke and why (one sentence each).
- A recommendation (update tests / leave them failing / other).
- An "Other" option so the user can give custom direction or ask a question back.

## When refactoring existing tests

- Identify tests coupled to implementation (named after functions, testing internal call sequences, breaking on safe refactors).
- Re-express them as behaviours. Multiple fine-grained function tests often collapse into fewer, clearer behaviour tests.
- Preserve coverage of edge cases — just reframe them behaviourally.

## Test level preference

Slight preference for higher-level tests (end-to-end, integration) over lower-level tests (unit). Higher-level tests exercise real interactions between components and reveal more about the actual robustness of the system; passing unit tests alone can give a false sense of security when the pieces don't integrate correctly.

That said, this is a *slight* preference, not a rule to avoid unit tests. Lower-level tests are still valuable when:
- They cover a meaningful, observable behaviour in the code (not just a function signature).
- They run locally and quickly, giving fast feedback on core code changes — a positive for developer experience.
- The equivalent higher-level test would be significantly slower or harder to run locally.

When higher-level tests are just as easy to run as unit tests, prefer them. When unit tests offer a clear DX advantage (speed, locality, isolation of a genuinely complex behaviour), write them too.

## Boundaries

This skill does not override explicit user instructions. If the user asks for a specific test structure or naming convention, follow their lead.
