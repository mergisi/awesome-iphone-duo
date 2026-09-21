# Contributing

Adding your own project is the point of this list. Self-promotion is welcome here — if you built it, you are the right person to describe it.

## Add an entry

1. Fork the repo and edit `README.md`.
2. Add one line to the section your project belongs in, keeping the list alphabetical.
3. Open a pull request with the project's name in the title.

The format is:

```markdown
- **[Project Name](https://link)** — What it is, in one sentence that says what it does rather than how it feels. License, if it is code.
```

A real example:

```markdown
- **[Hello Duo](hello-duo/)** — Hello World for the Duo. One SwiftUI app, two layouts, and the width threshold that tells folded from open. Lives in this repo; clone and run it.
```

Not up for writing the PR yourself? [Open an issue](../../issues/new?template=add-project.yml) and describe the project — someone will add it.

## What gets in

The bar is whether a Duo developer would be glad they clicked. Concretely:

- **Apps and code** should run on the Duo today, and should do something with the second screen. A universal iOS app that merely launches on a Duo is not a Duo project.
- **Articles and talks** should teach something specific — a layout technique, an API that behaves unexpectedly, a measurement. A first-impressions post is not that.
- **Tools** should be usable by someone other than their author.

Rejected on sight: rumours, renders, unboxing videos, launch announcements, paywalled posts with nothing readable before the wall, and links whose main purpose is to collect an email address.

Your project does not need stars, a website, or polish. A single file that demonstrates one thing well is a good entry.

## House rules

- **One entry per pull request.** Two projects, two PRs. It keeps review and reverts simple.
- **Write the description yourself, in your own words.** Do not paste a marketing tagline or a README's first paragraph.
- **Say if it is yours.** A sentence in the PR body is enough. It is not a strike against you.
- **Broken and abandoned links get removed.** If an entry stops resolving or the project stops building, it goes — open a PR to bring it back once it works again.

## Adding code to the repo

Sample code can live in this repo instead of being linked, the way `hello-duo/` does. That suits small, self-contained examples that would be a lonely repo of their own. If you want that, say so in the PR and include:

- A `README.md` in your folder: what it shows, how to run it, and the part worth reading.
- A license. The repo is MIT; an entry under a different license needs to say so in its own folder.
- No build output, no `xcuserdata`, no `.DS_Store`.

Anything larger than an example belongs in your own repo, linked from the list.

## Questions

Open an issue. A question about whether something fits is a fine reason to open one, and a faster path than writing a PR that turns out not to fit.
