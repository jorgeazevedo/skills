---
name: writing-pull-request-descriptions
description: 'Write pull request descriptions using the Guardian PR template, in plain, connected prose that describes the change as it is. Use when opening a pull request, writing or editing a PR description or body, or summarising a branch for review.'
---

# Writing Pull Request Descriptions

Whenever writing a pull request description, speak plainly and simply in connected prose, avoiding rhetorical tricks and flowery language. Plain writing still uses sentences of ordinary length, joined with linking words that show how one point leads to the next, so avoid runs of clipped sentences and fragments. Describe only what is there, not the decisions that were rejected. Let the code speak for itself, and provide extra context only where it will be needed for future colleagues.

This covers PR descriptions. It does not cover conversation with the user.

Code comments should only contain information that lasts as long as the code. Discussion of a change happens alongside the change itself, in its PR description.

## Template

Present every PR description using the template below, keeping the four headings in this order. You can only see what changed, while the author is the one who knows why it was made, how it was tested, how its success will be measured and how its risks will be handled. The description is a draft for the author to finish, so it must show the reader which parts you wrote:

```markdown
## What does this change?

> [!NOTE]
> * [ ] The following AI generated text was reviewed by the author

<one or two sentences on what the change does to the system>

## How has this change been tested?

## How can we measure success?

## Have we considered potential risks?


> [!NOTE]
> * [ ] The following AI generated text was reviewed by the author

<one short sentence for each risk a reviewer would need to act on>
```

Keep what you write short, because the reviewer has the diff in front of them. Describe the change in one or two sentences, and no more than 50 words, at the level of what it does to the system. Leave out details the diff already shows, such as file names, construct names, configuration values, wiring and renamed tests. Name only the risks a reviewer would need to act on, such as deleted resources or breaking changes, in one short sentence each.
