---
name: myvoice
description: Set up, apply, and improve the user's personal writing voice from a MYVOICE.md file in the current folder. Use for /myvoice, "write it in my voice", or voice-file setup and updates.
license: MIT
---

# My Voice Skill

This skill manages a per-folder **`MYVOICE.md`** file. `MYVOICE.md` is the
complete instruction set the LLM follows when writing in the owner's
voice. Each project folder gets its own copy, so voice can differ by
project. This SKILL.md only describes the process; it never holds style
rules itself.

A new folder normally has **no** `MYVOICE.md`. One is created only when
the user invokes this skill.

## When to use this skill

Use it when the user:

- types `/myvoice` (or `myvoice`, or asks to "run the myvoice skill")
- asks to "write it in my voice" or "use my voice"
- asks to set up, review, or update their voice file
- types `/myvoice <file name>` — then use that file instead of
  `MYVOICE.md`, so one folder can hold several voices

Do not use it for general writing requests where the user has not asked
for their own voice.

---

## 1. On invocation (/myvoice)

The voice file is `MYVOICE.md` by default. If the user invokes the
skill with a file name argument — `/myvoice <file name>` — use that
file instead of `MYVOICE.md` for everything below (reading, creating,
reviewing, updating). This lets one folder hold multiple custom voices
(e.g., `BLOGVOICE.md`, `WORKVOICE.md`). Like any voice file, a named
one loads for the whole session; switching voices means starting a
fresh session and invoking the skill with the other name.

Look for the voice file in the current working folder.

**If it does not exist — first-time setup:**

Assume the user does not know what this skill does. Before anything else:

1. **Introduce the skill** in a few short sentences: it builds a
   MYVOICE.md file in this folder; MYVOICE.md is the instruction set the AI
   follows to write in the user's voice; it improves every time the
   user edits a draft.
2. **Explain why the questions matter**: the answers (voice scores,
   who they are, who they write for, rules, banned words, platforms)
   are what steer every future draft. Blanks mean generic AI writing.
   Also tell the user: once the file is configured and loaded, the only
   way to stop using its instructions is to start a new session or
   clear the current context.
   And explain scope and portability: the voice file belongs to the
   folder the session runs in. A new session in a different folder
   starts from scratch unless a voice file was copied there first.
   Voice files are portable — the user can copy them between folders
   and keep more than one. With `/myvoice <file name>` they can load a
   voice file with another name, so one folder can hold several custom
   voices (each loaded from a fresh session).
3. Create `MYVOICE.md` from the template in section 5.
4. **Ask the initial questions.** Ask what the user already has or
   knows for each blank in the template: voice dimension scores,
   author, audience, relationship to reader, any known rules, banned
   words, structure preferences, and target platforms. Existing style
   guides, past writing samples, or "I don't know" are all fine answers.
5. **Also offer a guided setup**: walk them through the blanks one
   section at a time, with examples and suggested defaults for each,
   instead of answering free-form. Let them choose free-form, guided,
   or "skip for now and learn from my edits" (the feedback loop,
   section 3).
6. Write whatever answers they give into `MYVOICE.md`.

**If it already exists:**

Do not recreate or reset it, and skip the introduction — the user knows
the skill. Instead:

1. Read `MYVOICE.md` and **review it for unanswered questions**: `?/10`
   scores, `(fill in)` markers, or empty sections.
2. If blanks remain, list them briefly and **ask if the user wants help
   filling them in** (offer the same guided setup as above).
3. If everything is answered — or the user declines help — assume they
   want to run an iteration to improve `MYVOICE.md`: draft with it
   (section 2) and run the feedback loop (section 3). When the file is
   properly configured, also remind the user: to remove the voice
   style, they need to start a new session or clear the current
   context.

## 2. Writing a draft

1. Read `MYVOICE.md` from the current working folder.
2. Follow every rule in it: voice dimension scores, audience, core
   rules, banned words, structure preferences, platform formatting.
3. Save a copy of your first complete draft (the "original") before
   showing it to the user. You will need it for the feedback loop.

## 3. Feedback loop (how MYVOICE.md learns)

The loop needs only two data points per piece:

1. **original** — the first AI draft
2. **final** — the version the human approved

It does not matter how many editing rounds happened in between. Only the
first and last versions are compared.

When the user says the piece is final:

1. Compare the original draft with the final version.
2. List the concrete differences: words removed, structures changed,
   tone shifts, length changes.
3. Turn recurring differences into short candidate rules, phrased the
   way the rules in `MYVOICE.md` are phrased.
4. Classify each candidate by confidence:

   | Level | Meaning | Handling |
   |---|---|---|
   | High | Pattern seen in 3+ edits | Recommend adding |
   | Medium | Seen twice | Offer, let the human decide |
   | Low | Seen once | Mention only; do not add yet |

5. **Show the candidate rules to the user and ask which to keep.**
6. Write approved rules into `MYVOICE.md`. Adjust the voice
   dimension scores there too if the edits point that way.
7. Update the changelog at the bottom of `MYVOICE.md`: date + what changed.

## 4. Safety rules

- Never create `MYVOICE.md` unless the user invoked this skill.
- Never edit `MYVOICE.md` without the user's confirmation.
- Never remove existing rules unless the user asks.
- Keep every change small and note it in the `MYVOICE.md` changelog so it
  is easy to revert.

## 5. MYVOICE.md template

When creating a new `MYVOICE.md`, use exactly this structure (replace the
changelog date with today's date):

```markdown
# MYVOICE.md — Writing instructions

Read this whole file before drafting. Follow every rule.

## Voice dimensions (1-10)

| Dimension | Score | Notes |
|---|---|---|
| Formal (1) ↔ Casual (10) | ?/10 | |
| Deeply technical (1) ↔ Accessible (10) | ?/10 | |
| Serious (1) ↔ Playful (10) | ?/10 | |
| Concise (1) ↔ Elaborate (10) | ?/10 | |
| Reserved (1) ↔ Expressive (10) | ?/10 | |

## Author and audience

- **Who I am:** (fill in)
- **Who I write for:** (fill in)
- **Relationship to reader:** (fill in)

## Core rules

- (rules accumulate here through the feedback loop)

## Banned words and phrases

- (words the AI overuses and the owner never wants)

## Structure preferences

- (e.g., lead with the conclusion; short paragraphs)

## Platform formatting

| Platform | Requirement |
|---|---|
| X / Twitter | No markdown rendering — plain text only |
| Blog | Standard markdown |

## Changelog

- YYYY-MM-DD: created
```

## 6. What to expect

- **Week 1:** 3-5 edit cycles captured; first rules appear in MYVOICE.md.
- **Week 2:** 10+ rules; drafts noticeably closer to the owner's voice.
- **Month 1:** 30+ rules; voice dimension scores are calibrated.
- **Ongoing:** the rule set grows slowly and stabilizes.
