# skills
Agent skills, published as an [APM](https://microsoft.github.io/apm/) marketplace.

## Install

```sh
apm marketplace add jorgeazevedo/skills
apm install validate-github-actions@jorgeazevedo-skills
```

## Skills

| Skill | Description |
| --- | --- |
| [validate-github-actions](skills/validate-github-actions) | Validate GitHub Actions workflow YAML files using actionlint and zizmor |

## Adding a skill

Create `skills/<name>/SKILL.md`, then:

```sh
apm marketplace package add ./skills/<name> --name <name> --version <root version> --no-verify
```

## Releasing

Bump `version` in `apm.yml` (and the matching package entries), then:

```sh
apm marketplace check
apm pack                           # regenerates .claude-plugin/marketplace.json
git add apm.yml skills .claude-plugin/marketplace.json
git commit -m "Release vX.Y.Z" && git tag vX.Y.Z && git push --tags
```
