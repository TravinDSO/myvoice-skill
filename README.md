# myvoice — a portable writing-voice skill

`myvoice` teaches an AI agent to write like *you*.

It keeps a plain-text file called **`MYVOICE.md`** in whatever folder you
are working in. That file holds your rules: tone scores, who you are, who
you write for, words you never want, formatting per platform. The agent
reads it before every draft.

It also **learns**. When you finish editing a draft, the skill compares
its first version to your final version, spots the changes you keep
making, and offers them back as new rules. You approve; it writes them
into `MYVOICE.md`.

One folder can hold several voices — `/myvoice BLOGVOICE.md` loads a
different file.

Works with **Claude Code**, **Claude.ai**, and **OpenAI Codex CLI**.

---

## Install

### Claude Code

Copy the `myvoice` folder into your skills directory.

Personal (all projects):

```bash
cp -r myvoice ~/.claude/skills/myvoice
```

```powershell
Copy-Item -Recurse myvoice "$HOME\.claude\skills\myvoice"
```

Project only (shared with your team through the repo):

```bash
mkdir -p .claude/skills && cp -r myvoice .claude/skills/myvoice
```

Restart Claude Code. Type `/myvoice` to start.

### Claude.ai (web and desktop)

1. Use the ready-made zip: `dist/myvoice-skill.zip`
2. Go to **Settings → Capabilities → Skills**.
3. Click **+ → Create skill** and upload the zip.

The zip has the `myvoice/` folder at its root. That is the layout
Claude.ai expects.

### OpenAI Codex CLI

```bash
cp -r myvoice ~/.codex/skills/myvoice
```

```powershell
Copy-Item -Recurse myvoice "$HOME\.codex\skills\myvoice"
```

Codex picks up new skills automatically. Ask it to "use the myvoice
skill" or type `/myvoice`.

### Shared location (both agents, one copy)

Some builds of Claude Code and Codex also read `~/.agents/skills/`. If
yours does, install there once instead of twice:

```bash
cp -r myvoice ~/.agents/skills/myvoice
```

### Scripts

`install.sh` and `install.ps1` do the copying for you:

```bash
./install.sh claude     # or: codex | agents | all
```

```powershell
.\install.ps1 claude    # or: codex | agents | all
```

---

## Using it

1. `cd` into the folder you write in.
2. Run `/myvoice`.
3. The skill sees no `MYVOICE.md`, explains itself, and asks you setup
   questions. Answer them, pick guided setup, or skip and let it learn
   from your edits.
4. Write. Edit the draft until you like it. Say "this is final."
5. The skill proposes new rules. Approve the ones you want.

Repeat. After a few weeks `MYVOICE.md` holds 30+ rules and the drafts
land close on the first try.

## Notes

- `MYVOICE.md` belongs to a folder, not to the skill. Copy it between
  folders to carry your voice with you.
- Once a voice file is loaded in a session, the only way to unload it is
  to start a new session or clear the context.
- The skill never creates or edits `MYVOICE.md` without you asking.

## License

MIT — see `LICENSE`.
