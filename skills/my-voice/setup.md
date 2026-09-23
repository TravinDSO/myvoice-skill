# My Voice: setup

Read this file only to create a voice file or fill its blanks. Every rule in `SKILL.md` still applies.

## First-time setup

Assume the user does not know what this skill does.

1. **Introduce the skill** in a few short sentences. It builds a `MYVOICE.md` file in this folder. That file is the instruction set the AI follows to write in the user's voice. It improves each time the user edits a draft and says it is final.
2. **Explain why the questions matter.** The samples and answers steer every future draft. Blanks mean generic writing. Also tell the user:
   - Once the file is loaded, the only way to stop using it is a new session or a cleared context.
   - The file belongs to this folder. Copy it to use the voice in another folder.
   - `/my-voice <file name>` loads a voice file with another name, so one folder can hold several voices. The name must end in `VOICE.md`, for example `BLOGVOICE.md`. Someone who writes very differently across channels (for example chat and client email) can keep one voice file per channel, each with samples from that channel only.
3. **Offer three ways to continue:** answer free-form, a guided setup (one section at a time, with examples and a suggested default for each), or skip and learn from edits.
4. **Ask for samples first.** 2 to 4 pieces the user wrote without AI, about 100 to 300 words each, on different topics, from the kind of writing this voice is for. Label each by channel. Never use AI-assisted text or this skill's drafts. Ask the user to remove private names. If they have no samples, go to step 6.
5. **Derive rules from the samples.** For each sample, silently write what a default AI would produce from a one-line summary of it. Compare the two. Propose 5 to 10 rules from the differences: sentence length, contractions, openings and closings, punctuation, recurring small words, hedges, humor, and how the writer addresses the reader. Write each rule as a behavior you could check in a draft, with a short quote from the sample as evidence. No adjective-only rules. The user keeps or strikes each rule. Put kept rules under Core rules, tagged with the sample's channel, or [all] when two channels show it. Also propose a score for each voice dimension, with a short quote from the samples as its example, and fill the Channels rows the samples cover. The user confirms or changes each.
6. **Ask only what samples cannot show:** who they are, who they write for, their relationship to the reader, English variety, banned words and taboos, structure preferences, and the channels they write for. With no samples, also ask for voice scores and any rules they already know. Style guides and "I don't know" are fine answers.
7. **Create the voice file** from the template below once the user has answered or chosen to skip. Write only what the user said or approved. Do not invent their voice. Write `(none)` where the user says a section does not apply. Leave the other blanks as they are.

## Filling blanks later

For an existing voice file, offer the guided setup for the blank or missing sections only, using steps 4 to 6 where they apply. Never recreate or reset the file. Write only what the user approves.

## Voice file template

When you create a new voice file, use exactly this structure. Replace the changelog date with today's date.

```markdown
# MYVOICE.md: Writing instructions

Read this whole file before drafting. Follow every rule. Most important rules come first.

## Voice dimensions (1-10)

| Dimension | Score | Example from my writing |
|---|---|---|
| Formal (1) to Casual (10) | ?/10 | |
| Deeply technical (1) to Accessible (10) | ?/10 | |
| Serious (1) to Playful (10) | ?/10 | |
| Concise (1) to Elaborate (10) | ?/10 | |
| Reserved (1) to Expressive (10) | ?/10 | |

## Author and audience

- **Who I am:** (fill in)
- **Who I write for:** (fill in)
- **Relationship to reader:** (fill in)
- **English variety:** (fill in: US, UK, other)

## Samples

Style reference only. Do not reuse their facts or lines.

(fill in: 2 to 4 pieces I wrote without AI, labeled by channel)

## Habits

- Words and phrases I use: (fill in)
- Sentences, punctuation, and capitals: (fill in)

## Core rules

Most important first, each tagged [all] or a channel such as [email].

- (none yet)

## Banned words and phrases

- (fill in)

## Structure preferences

- (fill in)

## Channels

| Channel | Length | Opener and sign-off | Formatting |
|---|---|---|---|
| Email | (fill in) | (fill in) | (fill in) |
| Chat | (fill in) | (fill in) | (fill in) |

## Edit examples

Before/after pairs from my real edits, added through the feedback loop. Imitate the "Me" side only. Newest first, max 8. Format: AI: "..." Me: "..." Why: ...

(none yet)

## Observations

Unconfirmed patterns from my edits: date, channel, what changed. About 15 lines, oldest pruned.

(none yet)

## Changelog

- YYYY-MM-DD: created
```
