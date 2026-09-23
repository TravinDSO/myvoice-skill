---
name: my-voice
description: Write, edit, or audit text so it sounds like the user and not like AI, using a per-folder MYVOICE.md voice file that learns from the user's edits. Use when the user asks to draft or rewrite an email, post, article, bio, or message they will send or publish as themselves, especially when a MYVOICE.md file exists; for "write it in my voice"; for humanizing text, removing AI slop, or auditing a draft for AI patterns; or for setting up a voice file.
license: MIT
metadata:
  short-description: Write in your own voice and learn from your edits
---

# My Voice

Make writing sound like one specific person with something real to say. Two layers do this:

1. **The voice file.** A `MYVOICE.md` file in the current folder holds this person's writing samples, rules, and edit examples. It grows from the user's own edits.
2. **The baseline.** The **Pattern library** and **Evaluation** sections below remove canned AI patterns. They apply whether or not a voice file exists.

Order of precedence, highest first:

1. The user's instructions in this conversation.
2. The voice file.
3. This skill's editing rules and pattern library.

If the voice file allows something the pattern library bans (for example em dashes or emojis), follow the voice file.

## The voice file

- The default voice file is `MYVOICE.md` in the current working folder.
- `/my-voice <file name>` uses that file instead, for example `/my-voice BLOGVOICE.md`, so one folder can hold several voices. Use the named file for all reading and updating. Treat the first argument as a voice file only if its name ends in `VOICE.md` (any case) or the file has a `## Core rules` heading. Otherwise it is the task or the file to work on.
- A voice file loads for the whole session. To switch voices or stop using one, the user must start a new session or clear the context.
- The voice file belongs to the folder, not to the skill. Copy it to use the voice elsewhere.
- With no persistent folder (for example Claude.ai chat), ask the user to attach their voice file. After an approved change, return the full updated file for them to save.
- This skill holds the process. The voice file holds the person's style. Never write personal style rules into this skill.

## Choose the job

**Setup.** When the user invokes this skill by name (for example `/my-voice` or `$my-voice`) with no draft or task, or asks for setup, run **Setup job** below.

**Edit is the default** when the user supplies a draft. Rewrite it using the minimum effective changes. If nothing needs changing, say so and return the draft unchanged. Return the full edited draft followed by a short **What changed** section: one line per change, with like cuts grouped on one line, quoting the old phrase and the new one, or naming what was cut. Never write "improved clarity and flow" or "while preserving the original meaning." If the user asks for clean copy only, omit the notes.

**Audit.** When the user asks to audit, scan, flag, or detect patterns without rewriting, name each pattern found, quote the smallest useful excerpt, and give a short fix. Include voice file rule breaks. List the strongest findings first. Flag chatbot residue on one hit and listed words only in clusters. Never flag these on their own: anything a pattern says to keep in the writer's text, correct grammar, mixed registers, formal vocabulary, one "Additionally," or "To be clear," curly quotes, a letter-style greeting or sign-off, Markdown in a technical doc, or a habit the voice file or samples show. Do not score the writing, guess whether AI wrote it, or rewrite the draft unless asked.

**Draft.** When the user asks for new writing, apply the voice file and the rules below while matching the supplied source material and format. Do not invent facts, experiences, quotes, numbers, or opinions. Build around the most concrete details in the source. For anything longer than a few sentences, ask once for what is missing, such as the writer's take, a real example, numbers, or the ask. Invite rough notes in their own words and keep their phrases where they work. If the user wants a draft anyway, list the gaps after it (pattern 19). Write anything meant to be spoken for the ear: short sentences, contractions, numbers as spoken, no symbols or headings.

**Learn.** When the user says a piece is final, run the **Feedback loop** below.

## Setup job

Look for the voice file in the current working folder.

### No voice file: first-time setup

Read [setup.md](setup.md) in this skill's folder and follow it.

### Voice file exists

Do not recreate or reset it. Skip the introduction.

1. Read the file and look for blanks: `?/10` scores, `(fill in` markers, or a missing Samples, Habits, Channels, Edit examples, or Observations section. An old Platform formatting table counts as Channels.
2. If blanks remain, list them briefly and offer the guided setup in [setup.md](setup.md).
3. Otherwise, or if the user declines, ask for the piece to write or edit. Run the feedback loop when it is final. Remind the user once how to unload the voice.

## Before working

Read the voice file if one exists, including its samples and edit examples. If none exists, do the task with the baseline rules, then offer setup once, in one sentence. Use the **Pattern library** below as the main pattern reference. In a long session, re-read the samples and core rules before each new draft and after context compaction.

Read the entire draft or source before changing it. Identify:

- the point the reader should understand or act on
- whether the draft is the user's own writing or AI output
- the writer's vocabulary, cadence, bluntness, humor, uncertainty, and level of polish
- details that must survive, including names, numbers, examples, mechanisms, and opinions
- the channel (email, chat, social post, long-form, script) and its row in the voice file's Channels table

If the source is AI output, "the writer" in the rules below means the user. Keep the source's facts, names, numbers, and stated opinions. Its wording, fragments, rebuttals, metaphors, hedges, and formatting are not voice. Take voice from the voice file and samples. If unsure who wrote it, treat it as the user's.

For new or AI text, match that channel's samples in word choice, sentence length, punctuation, openings, and closings, but never reuse their content. In the user's own writing, the draft is the style reference, and a word or structure they repeat (here, in the samples, or in the voice file) is voice. Keep it even if a pattern lists it.

If no draft or usable source is provided, ask for it. For a short new draft, proceed when the topic and purpose are clear. Ask one concise question only when the missing audience, format, or intended outcome would materially change the result.

## Editing rules

- Follow every rule in the voice file.
- Preserve meaning. Never add unsupported claims or make the writer sound more or less certain than the source. Collapsing stacked hedges to one is not a change in certainty.
- Preserve voice. Keep distinctive vocabulary, spelling variant, dialect, idioms, code-switching, deliberate nonstandard grammar, humor, bluntness, admissions, fragments, digressions, and rough edges when they feel intentional. Do not normalize to US English.
- Keep opinions, criticism, negativity, and profanity at full strength. Add no balance or caveats the source lacks.
- Keep the writer's contractions, I/we/you, and small common words. Do not add commas, dashes, semicolons, adjectives, or emotion words they would not use, or swap a plain word for a longer one. Do not replace personal experience with statistics or expert claims.
- In new or AI text, use the writer's own words and formulas at the rate the samples show, not every time.
- Never add slang, lowercase, typos, stacked fragments, or invented anecdotes to sound human, or lower the vocabulary level. Take casual style only from the samples and voice file. With neither, write plain and short.
- Make the minimum effective edit. Leave strong human sentences alone.
- Lead with the point when setup adds nothing. Keep personal setup when it creates context, tension, or character.
- Prefer concrete facts, actions, mechanisms, consequences, names, and numbers over abstract importance. Never replace a specific detail with a general label.
- Preserve the requested structure unless it is creating the problem. Explain meaningful reorganization in **What changed**.

## Finish

After an edit or new draft, check the result against the **Evaluation** section below. Fix failures before returning the answer.

Remove a tell by deleting it or with the smallest rephrase that reads naturally, not by swapping in a synonym, another stock phrase, a new metaphor, or the same replacement punctuation every time.

Keep your first output in the conversation. The feedback loop needs it. In a long session, offer once to save it to a file next to the voice file so context compaction cannot lose it. In a git repo, suggest ignoring that file.

For an audit, return only evidence-backed findings. If no listed pattern appears, say so plainly. Do not manufacture findings to make the audit look useful.

## Feedback loop

This is how the voice file learns. It compares two versions of a piece:

1. **first output:** the first complete version this skill produced
2. **final:** the version the user approved. If they changed it elsewhere, ask for the version they actually sent.

Ignore the drafts in between, but count style instructions the user gave during revisions ("shorter," "never say thrilled") as evidence. If the first output is gone from context, say so and use the earliest version still available. Do not reconstruct it.

When the user says the piece is final:

1. Compare the first output with the final, and in an Edit job with the user's source. When the user reverted one of your changes, propose a keep-rule.
2. List the concrete differences. Label each voice (words, rhythm, tone, structure, formatting) or content (facts, scope). Only voice differences become rules, and only the user's changes count. AI wording they left alone proves nothing. If they only gave instructions, learn from those, not the diff.
3. Turn voice differences into short candidate rules: behaviors you could check in a draft, each with a short quote from the user when one exists, tagged by channel ([email], [chat], [all]). Voice score changes are candidates too.
4. Rate each candidate by the distinct pieces that show it, counting earlier pieces this session, changelog notes, and Observations. High (3+ pieces): recommend adding. Medium (2): offer and let the user decide. Low (1): mention only; do not add yet. A rule the user states as general ("never say thrilled") counts as High.
5. Show the candidates and ask which to keep. If one conflicts with an existing rule, show both and ask. Write only the approved rules. Widen a channel rule to [all] only after the same change shows up in a second channel.
6. Offer the one or two clearest before/after pairs of voice changes only for Edit examples, each with a one-line reason, and offer to log Low and Medium candidates under Observations. Remove an observation if the user later does the opposite.
7. If you wrote anything to the voice file, add a changelog line at the bottom: the date and what changed.

If the user made no changes and gave no style instructions, say so and propose no rules.

## Voice file safety rules

- Never create a voice file unless the user asks for one or agrees to setup.
- Never edit a voice file without the user's confirmation.
- Never remove existing rules unless the user asks.
- Samples hold only writing the user did without AI. Never add AI-assisted text or this skill's output to them.
- Keep each change small and log it in the voice file changelog so it is easy to revert.

## Pattern library

Use this library as evidence, not as a crude string-replacement list. Context matters. A phrase can be natural when it expresses the writer's real voice or carries precise meaning. Remove it when it delays, inflates, generalizes, or performs insight instead of delivering it.

Word lists are examples and go stale as models change. Structure matters more than any single word. One listed word proves little. Several close together is the tell. Text free of listed words and em dashes can still read as AI.

### 1. Secret or overlooked insight framing

Cut setups that make an ordinary point sound hidden or forbidden:

- "This is the part most people miss."
- "Nobody talks about this."
- "What nobody tells you."
- "What most people get wrong."

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
- "Let me be clear." / "Let's be honest." / "I want to be upfront:" / "I won't pretend..."
- "The uncomfortable truth is..."
- a rebuttal to an objection nobody raised: "I'm not saying X." / "This isn't about blame."

If the setup contains no information, delete it and say the thing. Do not add a rebuttal the source lacks. Keep one the writer wrote.

### 3. Mechanical rhythms and dramatic fragments

Watch for repeated sentence molds and stacked fragments:

- "You write the proposal. You record the Loom. You hit submit."
- "This is the problem. This is the opportunity. This is the system."
- "X. And Y. And Z."
- "That's it. That's the whole thing."
- reflexive triads and paired near-synonyms: "faster, smarter, cheaper" / "critique, correction, and clarity" / "challenges and opportunities"
- every sentence 15 to 25 words, none very short or very long
- identical paragraph openings or repeated point-detail-background structures

In new or AI text, list only what the source supports and use one precise word, not a pair. Match the spread of sentence lengths in the writer's samples, keeping their very short and very long sentences. With no samples, vary rhythm only when it helps the meaning. Keep fragments, pairs, and lists the writer wrote.

### 4. Fake rhetorical questions

Cut question-answer structures that are really one declarative sentence:

- "The companies from the old phase? They ended up fighting to survive."
- "What if I told you..."
- "Think about it:"
- "Plot twist:"
- one-word hooks answered at once: "The catch? ..." / "The result? ..."
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
- "X rather than merely Y" / "not simply X" / "less like X, more like Y"
- "It didn't ask. It didn't wait." / "Don't call it a tool. Call it a teammate."

State the stronger claim directly. A plain "not only... but also" or "however" contrast is ordinary writing.

### 6. Setup openers

Cut generic openings that postpone the subject:

- "Imagine if..." / "Picture this..." / "Have you ever..."
- "Here's the thing..."
- "I'll be honest..."
- "Honestly," or "And honestly," as a reflexive opener
- reflex praise, or a thank-you before every reply: "Great question!" / "You're absolutely right!" / "Thanks so much for sharing this!"
- a first sentence that restates the topic or the request: "In recent years, AI has transformed many industries."

If the writer agrees or likes something, name the specific thing. Keep an opener when it communicates real uncertainty, admission, or personality rather than manufactured intimacy.

### 7. Colon reveals

Cut a noun phrase followed by a colon and a lowercase dramatic reveal:

- "The best part: it learns."
- "The detail that makes it work: a separate agent grades it."

Use colons for real lists, labels, and quotations. Otherwise rewrite the reveal as a normal sentence.

### 8. Superficial analysis and -ing tails

A sentence that ends in ", [verb]-ing ..." often claims meaning instead of adding a fact:

- ", highlighting its importance" (also underscoring, reflecting, showcasing, emphasizing)
- ", ensuring a seamless experience" / ", fostering a sense of connection" / ", paving the way for..."
- chains of them: "She crossed the room, clutching the letter, scanning the faces."

Cut the clause, or make it its own sentence with the real consequence, mechanism, or example. Do not add -ing tails the writer did not use. Keep a single participle that adds a concrete action, and any the writer's samples use.

### 9. Importance puffery

Cut language that labels a fact important instead of proving why:

- "stands as a testament"
- "marks a pivotal moment"
- "plays a vital role"
- "solidifies its position"
- "underscores its significance"
- "serves as a powerful reminder" / "providing valuable insights into" / "reflects broader trends" / "sets the stage for"
- "That last part matters more than it sounds." / "X matters because..."
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
- "Let that sink in." / "Read that again." / "Full stop."
- "That matters way more than you'd think."
- "That's the trap."
- "That's the whole move." / "The punchline is..."
- a sentence that names the feeling or lesson a detail already showed: "She left the letter unopened. It was clear she wasn't ready."

Let the fact land. Add a concrete consequence only when it contributes new information. Do not add a lesson the source lacks. Keep one the writer stated.

### 12. Generic filler phrases

Cut these when they delay the point:

- "It's worth noting." / "It's important to note." / "At the end of the day." / "When it comes to." / "At its core."
- "In today's world." / "In the age of." / "In the world of." / "The reality is." / "The truth is."
- "In terms of." / "With regard to." / "In order to." / "Going forward."
- "In this article." / "Let's dive in." / "Let me walk you through..." / "Let's break it down."
- the same formal connector opening sentence after sentence: "Additionally," "Moreover," "Furthermore," "Notably,"
- announced counts that add nothing: "Here are five reasons..."

Use "and," "but," "so," or "also" if the writer does. Keep signposts that help the reader navigate a long document or talk.

### 13. Often-empty adverbs

Cut these when they add no meaning: just, literally, honestly, simply, actually, truly, fundamentally, importantly, crucially, inherently, inevitably, quietly, silently.

Keep one when it carries real emphasis, contrast, uncertainty, or the writer's natural spoken rhythm. People use "actually" more than AI does, so keep it when the samples do.

### 14. Buzzwords, inflated claims, and mannered metaphor

Avoid by default:

- game-changer, paradigm shift, revolutionary, groundbreaking, transformative, cutting-edge, "this is huge," "this changes everything," "move the needle"
- unlock, supercharge, elevate, embark, harness, empower, streamline, leverage, utilize, facilitate, foster, delve into, enhance, bolster, garner, navigate
- robust, seamless, comprehensive, crucial, pivotal, vibrant, paramount, multifaceted, meticulous, intricate, ever-evolving, tapestry, realm, beacon, interplay, insights, landscape
- brochure words: nestled, boasts (use "has"), breathtaking, renowned, hidden gem, a diverse array of
- current model tics, Claude especially: genuinely, "load-bearing," "the honest answer," "worth stating plainly," "key insight," "deliberate" as praise
- a coined label, false range, metaphor, or analogy in place of the plain term: "the acceleration trap," "from innovation to implementation to cultural transformation," "our north star," "Think of it like a highway for data."

Keep a word when it names something precise or the samples use it. Keep every label, metaphor, and analogy the writer wrote.

### 15. Fake-strong verbs and abstract nouns

Prefer a plain verb or a concrete action:

- "serves as," "acts as," "stands as," or "represents" when "is" would be clearer
- "has the ability to" instead of "can"
- "made a decision" instead of "decided"
- abstract nouns and false agency that hide who acted: "the implementation of cost reduction measures" for "we cut costs," "the decision emerged"
- upgraded words: assistance (help), demonstrate (show), obtain (get), commence (start)
- "improved efficiency" without a named process or measurable change

In new or AI text, prefer verbs and name who acted. Keep formal words and abstract nouns that are the writer's habit or the field's terms. Do not force a stronger-sounding verb when a simple form of "is" or "has" is the clearest choice.

### 16. Synonym cycling

Do not rename one thing repeatedly for stylistic variety. If the subject is an agent, keep calling it the agent unless the meaning changes. Repetition is clearer than cycling through "agent," "assistant," "tool," and "system."

### 17. Fake-profound and recap endings

Delete endings that manufacture depth or repeat what the reader just read:

- cute metaphors, aphorisms, or mic-drop lines
- "The future isn't coming. It's already here."
- "In conclusion..." / "Ultimately..." / "Overall..."
- a final paragraph that only summarizes the piece
- "Despite these challenges, X continues to thrive." / "Only time will tell." / "The future looks bright."
- a silver lining tacked onto a complaint: "...but it was a valuable learning experience."

End on the last concrete point, takeaway, decision, or next action. Keep real problems with the writer's view of them. Do not add hope, gratitude, or a lesson the source lacks. Keep a lesson or metaphor the writer ended on.

### 18. Formatting and mechanical slop

- Avoid em dashes. Use the smallest fix that reads naturally (a period, comma, parentheses, or "and" or "but"), and vary it. Never create a colon reveal (pattern 7).
- Do not use emojis, or arrows (→) and check-mark emoji as bullets, unless requested or clearly native to the writer's voice.
- Do not sprinkle bold text through sentences, or open bullets with a bold label and a colon ("- **Speed:** The build is faster.") in a short message or plain prose.
- Do not turn two sentences into a bullet list or two or three facts into a table.
- Do not add headings above tiny sections, Title Case headings the writer does not use, a title over an email or post, or "---" in a short piece.
- Format for where the text will be pasted. Never use markup the destination cannot render, such as **asterisks** in a text message.
- Unless the writer does it: no one sentence per line, "Agree?" or "Thoughts?" closers, or hashtag stacks in a social post, and no greeting, sign-off, recap, or list inside a chat thread.

### 19. Chatbot residue

Nothing addressed to the chat user belongs in the piece:

- "Certainly! Here's your email:" / "I hope this helps!" / "Let me know if you'd like it more formal."
- placeholders: "[Your Name]", "(add link here)", "2025-XX-XX"
- "As of my last update," "Based on the text you provided," "details are limited, but it likely..."

Return paste-ready text. Put questions and missing facts after the draft, never inside it. Never fill a gap with a placeholder or a guess. A template the user asked for may keep its placeholders.

### 20. Softened stance

- stacked hedges: "could potentially," "may eventually," "it might be worth considering"
- fake balance: "Both approaches have their merits." / "It depends on your specific needs."
- softened judgments: "This plan won't work." becomes "This plan may face some challenges."

Where the writer is sure, say it flatly. Do not add hedges, balance, or caveats the source lacks. Keep the writer's own hedges in their words ("I think," "probably," "not sure yet").

### 21. Letter formulas

Lines that could open or close any message:

- "I hope this message finds you well." / "I wanted to reach out regarding..." / "I am writing to..."
- "I assure you..." / "I am committed to..." / "Going forward, I will ensure..."
- "Please don't hesitate to reach out." / "Feel free to reach out with any questions."
- two or three stacked closing lines

In new or AI text, open with the ask or the news, use the writer's own greeting and sign-off, and add at most one closing line. Add none of these lines unless the samples or voice file show the writer uses it. In the writer's own message, keep their greeting and closing and cut only stacked closers.

### 22. Scripted empathy

A sympathy line, a paraphrase, a validation, then advice:

- "I'm so sorry to hear that. That sounds incredibly challenging."
- "It sounds like you're feeling..." / "Your feelings are completely valid."
- "That loss is real, and it's worth naming." / "That's not nothing." / "Sit with that."
- an unrequested list of tips after the sympathy line

A plain "I'm so sorry" is fine. The tell is the formula. Keep the writer's own words and warmth. Say one specific thing about the situation, and offer one concrete thing or ask a real question. Give advice only when asked.

### 23. Narrative stock

In stories, personal essays, and articles about people:

- invented stock names: Elara, Kael, Lyra, Voss, Thorne, or a default Emily or Sarah
- stock beats: "took a deep breath," "voice barely above a whisper," "the words hung in the air"
- atmosphere words stacked together: palpable, camaraderie, amidst, unspoken, solace, fleeting, shimmered
- quoted people who all sound like the narrator

Use names from the source or ask for them. Keep real quotes as said, fragments included. In new or AI text, replace a stock beat with a specific action or cut it. In the writer's own story, flag stock beats only when they cluster.

### The final test

If a sentence builds anticipation for the next sentence instead of carrying its own content, cut it and say the thing. Do not narrate a reaction to a fact. Do not pre-promise that something is important. Let the evidence land.

## Evaluation

Run this check after an edit or new draft. Fix every failure before returning the result. Make at most two passes.

### Voice file

- Every rule in the voice file is followed. Where it and the pattern library disagree, the voice file won.
- For new or AI text, side by side with a same-channel sample, if any, the result matches its word choice, sentence length, punctuation, and openings and closings. Rules beat samples. Fix the biggest differences.

### Meaning and voice

- The writer's point, claims, examples, numbers, and opinions are unchanged unless the user requested substantive revision.
- No facts, quotes, experiences, sources, or certainty were invented, and no judgment was softened.
- Distinctive vocabulary, cadence, bluntness, humor, uncertainty, and useful rough edges remain.
- Strong human sentences and habits shown in the samples were left alone.
- In each sentence you kept, against its source: no fewer contractions or first-person words, no longer words, and no added punctuation, adjectives, or merged sentences without a reason. Revert spans that drifted. Cut sentences do not count.
- The amount of editing matches the amount of actual slop.

### Clarity

- The piece reaches the point without throat-clearing and uses the available facts, mechanisms, and examples.
- No claim or description could move unchanged into a piece about another person, company, or product. Plain connective and courtesy lines are fine.

### Pattern check

- Re-scan the result against patterns 1 to 23. Look hardest at tells that survive edits: contrast reframes, triads, -ing tails, bold labels, one-line closers, and one replacement punctuation mark used again and again.
- No chatbot residue remains, no hedge or caveat was added, and you added no stock formula to a letter, sympathy note, or story.
- Remove each hit unless its pattern, the voice file, or the writer's habits say to keep it.

### Final read

- The draft sounds natural when read aloud to a sharp colleague.
- The writer would recognize the result as their own.
- The response contains the requested output and no extra lecture.

For an audit, verify that every finding includes a named pattern, a minimal quote, and a short fix.

## Credits

Built on [Human Speak](https://github.com/nateherkai/human-speak) by Nate Herk (MIT), [self-improving-skill](https://github.com/jzOcb/self-improving-skill) by jzOcb, and [myvoice-skill](https://github.com/TravinDSO/myvoice-skill) by TravinDSO (MIT). LICENSE and the [README](https://github.com/TravinDSO/myvoice-skill#credit) list every source.
