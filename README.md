# My Voice

A personal writing skill for AI agents. It writes, edits, and audits text so it sounds like you, not like generic AI prose.

It works in two layers:

- **Your voice file.** The skill keeps a plain-text `MYVOICE.md` file in the folder you work in. It holds short samples of your own writing, your rules, your habits, words you never want, and how you write in each channel (email, chat, posts). The agent reads it before every draft.
- **The anti-slop baseline.** A library of 23 common AI-writing patterns and a self-check. The agent removes those patterns from every draft, but keeps the habits that are really yours.

The skill also **learns**. When you finish editing a draft and say it is final, the skill compares its first version to your final version. It spots the changes you keep making and offers them back as new rules. You approve. It writes them into `MYVOICE.md`.

One folder can hold several voices. `/my-voice BLOGVOICE.md` loads a different file. A voice file name must end in `VOICE.md`. Any other file name is read as the file to work on.

Works with **Claude Code**, **Claude.ai**, and **OpenAI Codex CLI**.

## Credit

My Voice merges two projects:

- [Human Speak](https://github.com/nateherkai/human-speak) by [Nate Herk](https://github.com/nateherkai). The editing rules, pattern library, and evaluation checklist come from his work. Human Speak is released under the MIT License, and the original copyright notice is kept in [LICENSE](LICENSE). Human Speak in turn credits [No AI Slop](https://github.com/petergyang/no-ai-slop) by Peter Yang (MIT License) for part of its pattern taxonomy and editing workflow.
- [myvoice-skill](https://github.com/TravinDSO/myvoice-skill) by TravinDSO. The voice file, setup flow, named voices, and install scripts come from it.

The feedback loop (record the first draft, record the final, compare them, extract rules) is based on [self-improving-skill](https://github.com/jzOcb/self-improving-skill) by [jzOcb](https://github.com/jzOcb).

### Sources for the added patterns and methods

Patterns 19 to 23, the new examples in patterns 1 to 18, and the voice-sample methods are written in our own words from these sources. No source text is copied.

- Wikipedia: [Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing) (WikiProject AI Cleanup, CC BY-SA).
- Catalogs and tools: [No AI Slop](https://github.com/petergyang/no-ai-slop) by Peter Yang (portability test, false agency), [humanizer](https://github.com/blader/humanizer) by blader, [avoid-ai-writing](https://github.com/conorbronsdon/avoid-ai-writing) by Conor Bronsdon, [stop-slop](https://github.com/hardikpandya/stop-slop) by Hardik Pandya, Simon Willison's [LLM cliche highlighter](https://github.com/simonw/tools/blob/main/llm-cliche-highlighter.html), [Pangram](https://www.pangram.com/blog/walking-through-ai-phrases), [Graphite](https://graphite.io/five-percent/research/ai-tells), [tropes.fyi](https://tropes.fyi).
- Research on AI writing tells: [Reinhart et al. 2025, PNAS](https://www.pnas.org/doi/10.1073/pnas.2422455122), [Kobak et al. 2025, Science Advances](https://www.science.org/doi/10.1126/sciadv.adt3813), [Russell et al. 2025](https://arxiv.org/abs/2501.15654), [Sun et al. 2025](https://arxiv.org/abs/2502.12150), [Paech et al. 2025, Antislop](https://arxiv.org/abs/2510.15061), [Chakrabarty et al. 2025](https://arxiv.org/abs/2409.14509), [Masrour et al. 2025, DAMAGE](https://arxiv.org/abs/2501.03437).
- Research on voice drift, samples, and learning from edits: [van Nuenen 2026](https://arxiv.org/abs/2604.22142), [Abdulhai et al. 2026](https://arxiv.org/abs/2603.18161), [Baumler et al. 2026](https://arxiv.org/abs/2604.24444), [Wang et al. 2025](https://arxiv.org/abs/2509.14543), [Kumar et al. 2025](https://arxiv.org/abs/2502.13028), [Cho et al. 2025, TICL](https://arxiv.org/abs/2502.08972), [Gao et al. 2024, CIPHER](https://arxiv.org/abs/2404.15269), [Agarwal et al. 2025](https://arxiv.org/abs/2409.11360).

## What changed from Human Speak

- The skill is renamed from `human-speak` to `my-voice`.
- The three skill files are merged. `SKILL.md` holds the rules, the full pattern library (was `references/patterns.md`), and the evaluation checklist (was `references/evaluation.md`). Setup and the voice file template later moved to `setup.md` (see below).
- The plugin packaging, Codex metadata, and validation script are left out.
- Merged in myvoice-skill:
  - A per-folder `MYVOICE.md` voice file, created from a template when the user runs or agrees to setup.
  - First-time setup: free-form, guided, or learn from edits.
  - Named voice files with `/my-voice <file name>`.
  - A new **Learn** job: the feedback loop that turns your edits into voice rules.
  - Voice file safety rules: no create or edit without the user's approval.
  - A voice file check in the Evaluation section.
  - The voice file overrides the pattern library when they disagree.
  - Install scripts and a Claude.ai upload zip.
- Research update (September 2026):
  - The pattern library grows from 18 to 23 patterns. New: chatbot residue, softened stance, letter formulas, scripted empathy, and narrative stock.
  - Existing patterns gain newer measured tells: tacked-on -ing clauses, abstract nouns that hide who acted, formal connectors at the start of each sentence, reflexive triads, newer contrast forms, current model tics, mannered metaphor, bold-label bullets, and markup the destination cannot render.
  - The library says word lists go stale and that clusters, not single words, are the signal. Audit ranks findings and lists known false positives it must not flag.
  - Stronger protection for your voice. Words and structures you repeat count as voice. Dialect, spelling variant, opinions, and profanity stay at full strength. The skill adds no hedges, no fake balance, and no fake "human" touches such as slang or typos. Edits are checked against your source for drift.
  - The voice file template adds Samples, Habits, Channels (replaces Platform formatting), Edit examples, Observations, and English variety.
  - Setup asks for 2 to 4 writing samples you wrote without AI. It compares each one with a default AI version and proposes rules from the differences. You keep or strike each rule.
  - Setup steps and the voice file template moved to `skills/my-voice/setup.md`. It loads only when a voice file is created or has blanks, so normal runs cost fewer tokens.
  - Draft asks once for your take, an example, and numbers before a long draft. Missing facts are listed after the draft, never left as placeholders.
  - The feedback loop learns only from your voice changes, not from content edits. It counts style instructions and reverts, tags rules by channel, checks for conflicts, saves before/after edit examples, keeps an Observations log across sessions, and asks for the version you actually sent. Voice score changes now need your approval.
  - What changed notes quote the old and new phrase instead of a canned summary.
  - Evaluation adds a side-by-side sample check, a drift check, and a portability test, with at most two passes.
  - The trigger description covers everyday drafting. `/my-voice rewrite this intro` and `/my-voice post.md` are read as the task or the file to work on. Only a name ending in `VOICE.md` loads a voice file. With no voice file, the skill does the task first and then offers setup once.
  - When the source is AI output, the skill takes voice from your voice file and samples, not from the AI text. When it is your own writing, your draft is the style reference and edits stay minimal.
  - The em dash fix no longer suggests a colon, which conflicted with the colon-reveal pattern. The inherited "sentence case after a colon" rule is removed, because it changed people's own punctuation.
  - The skill folder carries its own `LICENSE`. A new `evals/` folder holds 9 test cases.

## Layout

```
myvoice-skill/
├── LICENSE                   # MIT: Nate Herk and TravinDSO
├── README.md
├── install.sh / install.ps1  # copy the skill into an agent's skills folder
├── dist/
│   └── my-voice-skill.zip    # upload zip for Claude.ai
├── evals/
│   └── cases.md              # test cases to run before a release
└── skills/
    └── my-voice/
        ├── SKILL.md          # the skill: jobs, rules, patterns, evaluation
        ├── setup.md          # first-time setup and the voice file template
        └── LICENSE           # MIT notice that travels with the skill
```

## Install

### Scripts

```bash
./install.sh claude     # or: codex | agents | all
```

```powershell
.\install.ps1 claude    # or: codex | agents | all
```

`all` installs for Claude Code and Codex. `agents` installs to `~/.agents/skills/`, which some builds of both agents read.

### By hand

Claude Code:

```sh
rm -rf ~/.claude/skills/my-voice
cp -r skills/my-voice ~/.claude/skills/
```

Codex CLI:

```sh
rm -rf ~/.codex/skills/my-voice
cp -r skills/my-voice ~/.codex/skills/
```

### Claude.ai (web and desktop)

1. Use the zip: `dist/my-voice-skill.zip`. It has the `my-voice/` folder at its root.
2. Go to **Settings → Capabilities → Skills**.
3. Click **+ → Create skill** and upload the zip.

## Using it

1. Open a session in the folder you write in.
2. Run `/my-voice`.
3. The skill sees no `MYVOICE.md`, explains itself, and asks for 2 to 4 short samples of your own writing (done without AI). It proposes rules from them and asks a few questions. Answer them, pick guided setup, or skip and let it learn from your edits.
4. Ask for a draft, or paste one to edit. Edit the result until you like it. Say "this is final."
5. The skill proposes new rules. Approve the ones you want.

You can also paste any draft and ask the skill to edit or audit it. Without a voice file, it still removes AI patterns.

## Notes

- `MYVOICE.md` belongs to a folder, not to the skill. Copy it between folders to carry your voice.
- On Claude.ai there is no folder. Attach your voice file to the chat. After an approved change, the skill gives you the full updated file to save.
- Once a voice file is loaded in a session, the only way to unload it is a new session or a cleared context.
- The skill never creates or edits `MYVOICE.md` without your approval.
