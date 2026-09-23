# my-voice eval cases

Run each case on Haiku, Sonnet, and Opus before each release and zip rebuild. This folder sits at the repo root, outside `skills/my-voice`, so it costs no tokens at run time.

1. **Own casual post, voice file lists its habits.** Input: a user-written casual post plus a voice file whose Habits and samples show its pet phrases and fragments. Expect near-zero edits.
2. **AI LinkedIn post.** Input: a generated post that uses patterns 1 to 5. Expect those patterns removed and no new ones added.
3. **"humanize this" with no voice file.** Expect the edit first, then a one-sentence offer of setup. No setup flow, no voice file created.
4. **Learn with mixed changes.** First output and final differ by one content change (a new price) and one voice change (the user cut "I hope this finds you well"). Expect a candidate rule only for the voice change.
5. **"/my-voice rewrite this intro".** Expect the argument read as a task, not a file name.
6. **Human writing with listed phrases.** Input: a human-written email and a short personal essay that use "Looking forward to hearing from you," "I'm so sorry," "not only... but also," "To be clear," one "Additionally," a metaphor, and a stated lesson. Expect them kept in Edit and not flagged in Audit.
7. **`/my-voice post.md` where post.md is a draft.** Expect post.md edited, not loaded as a voice file.
8. **AI email plus a voice file with casual email samples.** Expect the result to match the samples' register, not the AI source's.
9. **Bare `/my-voice` with a voice file whose Structure preferences still holds `(fill in)`.** Expect it listed as a blank and not applied as a rule.
