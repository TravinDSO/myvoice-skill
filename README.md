# My Voice

A personal writing skill for AI agents. It writes, edits, and audits text so it sounds like you, not like generic AI prose.

It works in two layers:

- **Your voice file.** The skill keeps a plain-text `MYVOICE.md` file in the folder you work in. It holds your rules: tone scores, who you are, who you write for, words you never want, and formatting per platform. The agent reads it before every draft.
- **The anti-slop baseline.** A library of 18 common AI-writing patterns and a self-check. The agent removes those patterns from every draft.

The skill also **learns**. When you finish editing a draft and say it is final, the skill compares its first version to your final version. It spots the changes you keep making and offers them back as new rules. You approve. It writes them into `MYVOICE.md`.

One folder can hold several voices. `/my-voice BLOGVOICE.md` loads a different file.

Works with **Claude Code**, **Claude.ai**, and **OpenAI Codex CLI**.

## Credit

My Voice merges two projects:

- [Human Speak](https://github.com/nateherkai/human-speak) by [Nate Herk](https://github.com/nateherkai). The editing rules, pattern library, and evaluation checklist come from his work. Human Speak is released under the MIT License, and the original copyright notice is kept in [LICENSE](LICENSE). Human Speak in turn credits [No AI Slop](https://github.com/petergyang/no-ai-slop) by Peter Yang (MIT License) for part of its pattern taxonomy and editing workflow.
- [myvoice-skill](https://github.com/TravinDSO/myvoice-skill) by TravinDSO. The voice file, setup flow, named voices, and install scripts come from it.

The feedback loop (record the first draft, record the final, compare them, extract rules) is based on [self-improving-skill](https://github.com/jzOcb/self-improving-skill) by [jzOcb](https://github.com/jzOcb).

## What changed from Human Speak

- The skill is renamed from `human-speak` to `my-voice`.
- The three skill files are merged into one. `SKILL.md` now holds the rules, the full pattern library (was `references/patterns.md`), and the evaluation checklist (was `references/evaluation.md`).
- The plugin packaging, Codex metadata, and validation script are left out.
- Merged in myvoice-skill:
  - A per-folder `MYVOICE.md` voice file, created from a template on first use.
  - First-time setup: free-form, guided, or learn from edits.
  - Named voice files with `/my-voice <file name>`.
  - A new **Learn** job: the feedback loop that turns your edits into voice rules.
  - Voice file safety rules: no create or edit without the user's approval.
  - A voice file check in the Evaluation section.
  - The voice file overrides the pattern library when they disagree.
  - Install scripts and a Claude.ai upload zip.

## Layout

```
myvoice-skill/
├── LICENSE                   # MIT: Nate Herk and TravinDSO
├── README.md
├── install.sh / install.ps1  # copy the skill into an agent's skills folder
├── dist/
│   └── my-voice-skill.zip    # upload zip for Claude.ai
└── skills/
    └── my-voice/
        └── SKILL.md          # the whole skill
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
cp -r skills/my-voice ~/.claude/skills/my-voice
```

Codex CLI:

```sh
cp -r skills/my-voice ~/.codex/skills/my-voice
```

### Claude.ai (web and desktop)

1. Use the zip: `dist/my-voice-skill.zip`. It has the `my-voice/` folder at its root.
2. Go to **Settings → Capabilities → Skills**.
3. Click **+ → Create skill** and upload the zip.

## Using it

1. Open a session in the folder you write in.
2. Run `/my-voice`.
3. The skill sees no `MYVOICE.md`, explains itself, and asks setup questions. Answer them, pick guided setup, or skip and let it learn from your edits.
4. Ask for a draft, or paste one to edit. Edit the result until you like it. Say "this is final."
5. The skill proposes new rules. Approve the ones you want.

You can also paste any draft and ask the skill to edit or audit it. Without a voice file, it still removes AI patterns.

## Notes

- `MYVOICE.md` belongs to a folder, not to the skill. Copy it between folders to carry your voice.
- Once a voice file is loaded in a session, the only way to unload it is a new session or a cleared context.
- The skill never creates or edits `MYVOICE.md` without your approval.
