---
name: my-voice
description: Write, edit, or audit text in the user's own voice. Keeps a per-folder MYVOICE.md voice file, learns new rules from the user's edits, and removes recognizable AI phrasing. Use for /my-voice, "write it in my voice", setting up or updating a voice file, humanizing writing, removing AI slop, or auditing a draft for AI patterns.
license: MIT
metadata:
  short-description: Write in your own voice and learn from your edits
---

# My Voice

Make writing sound like one specific person with something real to say. Two layers do this:

1. **The voice file.** A `MYVOICE.md` file in the current folder holds this person's rules: voice scores, who they are, who they write for, core rules, banned words, structure, and platform formatting. It grows from the user's own edits.
2. **The baseline.** The **Pattern library** and **Evaluation** sections below remove canned AI patterns. They apply whether or not a voice file exists.

Order of precedence, highest first:

1. The user's instructions in this conversation.
2. The voice file.
3. This skill's editing rules and pattern library.

If the voice file allows something the pattern library bans (for example em dashes or emojis), follow the voice file.

## The voice file

- The default voice file is `MYVOICE.md` in the current working folder.
- `/my-voice <file name>` uses that file instead, for example `/my-voice BLOGVOICE.md`. One folder can hold several voices. Use the named file for everything below: reading, creating, reviewing, and updating.
- A voice file loads for the whole session. To switch voices or stop using one, the user must start a new session or clear the context.
- The voice file belongs to the folder, not to the skill. A session in another folder starts with no voice file unless the user copies one there.
- This skill holds the process. The voice file holds the person's style. Never write personal style rules into this skill.

## Choose the job

**Setup.** When the user types `/my-voice` with no draft or task, run **On invocation** below.

**Edit is the default** when the user supplies a draft. Rewrite it using the minimum effective changes. Return the full edited draft followed by a short **What changed** section. If the user asks for clean copy only, omit the notes.

**Audit.** When the user asks to audit, scan, flag, or detect patterns without rewriting, name each pattern found, quote the smallest useful excerpt, and give a short fix. Include voice file rule breaks as findings. Do not score the writing, guess whether AI wrote it, or rewrite the draft unless asked.

**Draft.** When the user asks for new writing, apply the voice file and the rules below while matching the supplied source material and format. Do not invent facts, experiences, quotes, numbers, or opinions.

**Learn.** When the user says a piece is final, run the **Feedback loop** below.

## On invocation

Look for the voice file in the current working folder.

### No voice file: first-time setup

Assume the user does not know what this skill does.

1. **Introduce the skill** in a few short sentences. It builds a `MYVOICE.md` file in this folder. That file is the instruction set the AI follows to write in the user's voice. It improves each time the user edits a draft and says it is final.
2. **Explain why the questions matter.** The answers steer every future draft. Blanks mean generic writing. Also tell the user:
   - Once the file is loaded, the only way to stop using it is a new session or a cleared context.
   - The file belongs to this folder. Copy it to use the voice in another folder.
   - `/my-voice <file name>` loads a voice file with another name, so one folder can hold several voices.
3. Create the voice file from the **Voice file template** below.
4. **Ask the initial questions.** For each blank in the template, ask what the user already has: voice scores, who they are, audience, relationship to the reader, known rules, banned words, structure preferences, and target platforms. Style guides, past writing samples, and "I don't know" are all fine answers.
5. **Offer three ways to continue:** answer free-form, a guided setup (one section at a time, with examples and a suggested default for each), or skip and learn from edits.
6. Write the answers into the voice file. Base every rule on what the user said or on their samples. Do not invent their voice.

### Voice file exists

Do not recreate or reset it. Skip the introduction.

1. Read the file and look for blanks: `?/10` scores, `(fill in)` markers, or empty sections.
2. If blanks remain, list them briefly and ask if the user wants help to fill them in. Offer the guided setup.
3. If nothing is blank, or the user declines help, ask for the piece to write or edit. Then draft with the voice file and run the feedback loop when the piece is final. Remind the user once that a new session or a cleared context removes the voice.

## Before working

Read the voice file if one exists. Use the **Pattern library** section below as the complete pattern and phrase library.

Read the entire draft or source before changing it. Identify:

- the point the reader should understand or act on
- the writer's vocabulary, cadence, bluntness, humor, uncertainty, and level of polish
- details that must survive, including names, numbers, examples, mechanisms, and opinions
- the target platform, if the voice file has formatting rules for it

If no draft or usable source is provided, ask for it. For a new draft, proceed when the topic and purpose are clear. Ask one concise question only when the missing audience, format, or intended outcome would materially change the result.

## Editing rules

- Follow every rule in the voice file: voice scores, audience, core rules, banned words, structure preferences, and platform formatting.
- Preserve meaning. Never add unsupported claims or make the writer sound more certain than the source.
- Preserve voice. Keep distinctive vocabulary, humor, bluntness, admissions, fragments, digressions, and rough edges when they feel intentional.
- Make the minimum effective edit. Leave strong human sentences alone.
- Lead with the point when setup adds nothing. Keep personal setup when it creates context, tension, or character.
- Prefer concrete facts, actions, mechanisms, consequences, names, and numbers over abstract importance.
- Use direct verbs and active voice when clearer. Do not force every sentence into the same rhythm.
- Repeat the correct word when it improves clarity. Do not rotate synonyms merely to avoid repetition.
- Do not narrate the reader's reaction or announce that a point is important. Make the evidence carry the emphasis.
- Avoid em dashes by default. Do not use emojis unless the user requests them or the existing voice clearly relies on them.
- Preserve the requested structure unless it is creating the problem. Explain meaningful reorganization in **What changed**.

## Finish

After an edit or new draft, check the result against the **Evaluation** section below. Fix failures before returning the answer.

Keep a copy of this first complete version (the "original") in the conversation. The feedback loop needs it.

For an audit, return only evidence-backed findings. If no listed pattern appears, say so plainly. Do not manufacture findings to make the audit look useful.

## Feedback loop

This is how the voice file learns. It needs two versions of a piece:

1. **original:** the first complete version this skill produced
2. **final:** the version the user approved

Ignore the rounds in between. Compare only the first and last versions.

When the user says the piece is final:

1. Compare the original with the final.
2. List the concrete differences: words removed or added, structures changed, tone shifts, length changes.
3. Turn recurring differences into short candidate rules. Phrase them like the rules already in the voice file.
4. Give each candidate a confidence level. Count earlier edits in this session and matching changelog notes in the voice file as evidence.

   | Level | Meaning | Handling |
   |---|---|---|
   | High | Pattern seen in 3+ edits | Recommend adding |
   | Medium | Seen twice | Offer, let the user decide |
   | Low | Seen once | Mention only; do not add yet |

5. Show the candidates and ask which to keep.
6. Write the approved rules into the voice file. Adjust the voice scores if the edits point that way.
7. Add a changelog line at the bottom of the voice file: the date and what changed.

If the user made no changes, say so and propose no rules.

## Voice file safety rules

- Never create a voice file unless the user invoked this skill.
- Never edit a voice file without the user's confirmation.
- Never remove existing rules unless the user asks.
- Keep each change small and log it in the voice file changelog so it is easy to revert.

## Pattern library

Use this library as evidence, not as a crude string-replacement list. Context matters. A phrase can be natural when it expresses the writer's real voice or carries precise meaning. Remove it when it delays, inflates, generalizes, or performs insight instead of delivering it.

### 1. Secret or overlooked insight framing

Cut setups that make an ordinary point sound hidden or forbidden:

- "This is the part most people miss."
- "Nobody talks about this."
- "What nobody tells you."
- "The part nobody realizes."
- "Here's the part that surprises people."
- "What most people get wrong."
- "The part everyone misses."

State the claim and support it.

### 2. Tee-ups, reveals, and reaction narration

Cut sentences that only advertise the next sentence or narrate the writer's reaction:

- "Here's the part that got me."
- "Here's where it gets crazy," "wild," or "interesting."
- "Here's the kicker."
- "And that's when it clicked."
- "Let me zoom out, because..."
- "Which brings me to the thing I really care about..."
- "I want you to sit with this for a second."
- "It genuinely changed how I think."
- "Every other X is built on it."
- "Here's what I mean."
- "Let me be clear."
- "The uncomfortable truth is..."

If the setup contains no information, delete it and say the thing.

### 3. Mechanical rhythms and dramatic fragments

Watch for repeated sentence molds and stacked fragments:

- "You write the proposal. You record the Loom. You hit submit."
- "This is the problem. This is the opportunity. This is the system."
- "X. And Y. And Z."
- "That's it. That's the whole thing."
- triadic adjective stacks such as "faster, smarter, cheaper"
- identical paragraph openings or repeated point-detail-background structures

Vary rhythm only when it helps the meaning. Do not remove a clear fragment that genuinely belongs to the writer.

### 4. Fake rhetorical questions

Cut question-answer structures that are really one declarative sentence:

- "The companies from the old phase? They ended up fighting to survive."
- "What if I told you..."
- "Think about it:"
- "Plot twist:"
- a self-answered "Question? Answer." pair used for artificial momentum

Real questions are fine when the reader should actually consider or answer them.

### 5. Reframes, binary contrasts, and negative listing

Cut formulaic contrast structures:

- "It's not just X, it's Y."
- "This isn't X. It's Y."
- "The question isn't X, it's Y."
- "It's a belief, not a control."
- "Not a tool. Not a feature. A revolution."
- "Not A, not B, not C... D."
- "You don't have an X problem. You have a Y problem."

State the stronger claim directly.

### 6. Setup openers

Cut generic openings that postpone the subject:

- "Imagine if..."
- "Picture this..."
- "Have you ever..."
- "Here's the thing..."
- "I'll be honest..."
- "Honestly," or "And honestly," as a reflexive opener

Keep an opener when it communicates real uncertainty, admission, or personality rather than manufactured intimacy.

### 7. Colon reveals

Cut a noun phrase followed by a colon and a lowercase dramatic reveal:

- "The best part: it learns."
- "The detail that makes it work: a separate agent grades it."

Use colons for real lists, labels, and quotations. Otherwise rewrite the reveal as a normal sentence.

### 8. Superficial analysis

Trailing clauses built from these words often pretend to explain significance:

- highlighting
- underscoring
- reflecting
- showcasing

Replace the performance of analysis with a real consequence, mechanism, or example. If none exists, cut the clause.

### 9. Importance puffery

Cut language that labels a fact important instead of proving why:

- "stands as a testament"
- "marks a pivotal moment"
- "plays a vital role"
- "solidifies its position"
- "underscores its significance"
- "That last part matters more than it sounds."
- "The key point is..."
- "This distinction matters."
- "As you can see..."
- redundant "In other words..."

State the fact, mechanism, or consequence and let the reader judge its weight.

### 10. Vague authority

Do not invent consensus or research:

- "Experts agree."
- "Studies show."
- "Industry reports suggest."
- "Many argue."
- "Widely regarded as."

Name the source and describe what it found. If no source exists, remove or qualify the claim.

### 11. Filler after a fact or statistic

Cut commentary that tells the reader how to react:

- "That just doesn't happen."
- "That's just unheard of."
- "Let that sink in."
- "That matters way more than you'd think."
- "That's the trap."
- "That's the whole move."

Let the fact land. Add a concrete consequence only when it contributes new information.

### 12. Generic filler phrases

Cut these when they delay the point:

- "It's worth noting."
- "It's important to note."
- "At the end of the day."
- "When it comes to."
- "At its core."
- "In today's world."
- "In the age of."
- "In the world of."
- "The reality is."
- "The truth is."
- "In terms of."
- "With regard to."
- "In order to."
- "Going forward."
- "In this article."
- "Let's dive in."

### 13. Often-empty adverbs

Cut these when they add no meaning:

- just
- literally
- honestly
- simply
- actually
- truly
- fundamentally
- importantly
- crucially
- inherently
- inevitably
- quietly
- silently

Keep one when it carries real emphasis, contrast, uncertainty, or the writer's natural spoken rhythm.

### 14. Buzzwords and inflated claims

Avoid by default:

- game-changer
- paradigm shift
- revolutionary
- unlock
- supercharge
- delve into
- foster
- leverage
- utilize
- facilitate
- empower
- streamline
- robust
- cutting-edge
- "this is huge"
- "this changes everything"
- tapestry
- realm
- beacon
- multifaceted
- meticulous
- intricate
- paramount
- transformative
- elevate
- embark
- harness
- ever-evolving
- "move the needle"

Some words have legitimate technical or business uses. Keep them when they name something precise. Replace them when they merely inflate the sentence.

### 15. Fake-strong verbs and abstract nouns

Prefer a plain verb or a concrete action:

- "serves as," "acts as," or "functions as" when "is" would be clearer
- "has the ability to" instead of "can"
- "made a decision" instead of "decided"
- "improved efficiency" without a named process or measurable change

Do not force a stronger-sounding verb when a simple form of "is" or "has" is the clearest choice.

### 16. Synonym cycling

Do not rename one thing repeatedly for stylistic variety. If the subject is an agent, keep calling it the agent unless the meaning changes. Repetition is clearer than cycling through "agent," "assistant," "tool," and "system."

### 17. Fake-profound and recap endings

Delete endings that manufacture depth or repeat what the reader just read:

- cute metaphors, aphorisms, or mic-drop lines
- "The future isn't coming. It's already here."
- "In conclusion..."
- "Ultimately..."
- "Overall..."
- a final paragraph that only summarizes the piece

End on the last concrete point, takeaway, decision, or next action.

### 18. Formatting and mechanical slop

- Avoid em dashes. Use a period, comma, parentheses, colon, or "and" or "but."
- Do not use emojis unless requested or clearly native to the writer's voice.
- Do not sprinkle bold text through sentences for artificial emphasis.
- Do not turn two sentences into a bullet list.
- Do not add headings above tiny sections.
- Use sentence case after a colon unless grammar, a proper noun, a title, or code requires otherwise.

### The final test

If a sentence builds anticipation for the next sentence instead of carrying its own content, cut it and say the thing. Do not narrate a reaction to a fact. Do not pre-promise that something is important. Let the evidence land.

## Evaluation

Run this check after an edit or new draft. Fix every failure before returning the result.

### Voice file

- Every core rule, banned word, structure preference, and platform rule in the voice file is followed.
- Tone matches the voice scores.
- Where the voice file and the pattern library disagree, the voice file won.

### Meaning and voice

- The writer's point, claims, examples, numbers, and opinions are unchanged unless the user requested substantive revision.
- No facts, quotes, experiences, sources, or certainty were invented.
- Distinctive vocabulary, cadence, bluntness, humor, uncertainty, and useful rough edges remain.
- Strong human sentences were left alone.
- The amount of editing matches the amount of actual slop.

### Clarity

- The piece reaches the point without generic throat-clearing.
- Abstract claims are replaced with available facts, mechanisms, examples, or consequences.
- Direct verbs and active voice are used where they improve clarity.
- The same subject is named consistently instead of being rotated through synonyms.
- Sentence and paragraph rhythms do not fall into repetitive templates.

### Pattern check

- Secret-insight framing, tee-ups, colon reveals, binary reframes, negative lists, and fake questions are removed.
- Superficial analysis, importance puffery, vague authority, and reaction narration are removed or supported.
- Generic filler, empty adverbs, inflated buzzwords, and fake-strong verbs are removed unless they carry precise meaning.
- Fake-profound endings and recap paragraphs are removed.
- Em dashes, unnecessary emojis, decorative bold, tiny headings, and unnecessary lists are absent unless requested or allowed by the voice file.

### Final read

- The draft sounds natural when read aloud to a sharp colleague.
- The writer would recognize the result as their own.
- The ending lands on a concrete point, takeaway, or next action.
- The response contains the requested output and no extra lecture.

For an audit, verify that every finding includes a named pattern, a minimal quote, and a short fix. Do not score the draft or claim to know whether AI wrote it.

## Voice file template

When you create a new voice file, use exactly this structure. Replace the changelog date with today's date.

```markdown
# MYVOICE.md: Writing instructions

Read this whole file before drafting. Follow every rule.

## Voice dimensions (1-10)

| Dimension | Score | Notes |
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

## Core rules

- (rules accumulate here through the feedback loop)

## Banned words and phrases

- (words the AI overuses and the owner never wants)

## Structure preferences

- (for example: lead with the conclusion; short paragraphs)

## Platform formatting

| Platform | Requirement |
|---|---|
| X / Twitter | No markdown rendering, plain text only |
| Blog | Standard markdown |

## Changelog

- YYYY-MM-DD: created
```

## Credits

- Pattern library, editing rules, and evaluation: [Human Speak](https://github.com/nateherkai/human-speak) by Nate Herk (MIT).
- Feedback loop: [self-improving-skill](https://github.com/jzOcb/self-improving-skill) by jzOcb.
- Voice file, setup flow, and named voices: [myvoice-skill](https://github.com/TravinDSO/myvoice-skill) by TravinDSO (MIT).
