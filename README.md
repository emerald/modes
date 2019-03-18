# Syntax-Highlighting Emerald

There is currently syntax-highlighting for Emerald in the following
environments:

  * [vim](envs/vim/) ([install](envs/vim#installing))
  * [The `listings` package for LaTeX](envs/listings)
    ([install](envs/listings#installing))

## Design and Implementation

An Emerald syntax-highlighting specification consists of the following:

  1. A list of keywords
  2. A list of built-ins
  3. A specification of what comments are like
  4. A specification of what string and character constants are like
  5. A specification to ignore casing (Emerald is case-insensitive)

For points 1-2, we make use of the shell-scripts `bin/getkeywords.sh`
and `bin/getbuiltins.sh`, which are expected to be present in the
source directory of an Emerald compiler. These scripts are expected to
print a list of keywords and built-ins, respectively; separated, and
terminated by line breaks.

These lists are then munged to fit whatever mode we are generating
(e.g., prefixed by `syn keyword` for vim mode), and wrapped to fulfil
points 3-5 above. This process is guided by [a common bash
template](template.sh).

This template assumes that a number of scripts are in your `PATH`. In
particular, the scripts in the [scripts](scripts) and
[envs/common](envs/common) directories, as well as an environment
specific-directory (e.g., [envs/vim](envs/vim) when generating a vim
mode). The [`Makefile`](Makefile) takes care of this `PATH`-handling
for you.

Overall, we use a template for the following reasons:

  1. It allows to leverage `bin/getkeywords.sh` and
     `bin/getbuiltins.sh` (reducing maintenance effort)
  2. It allows to include [the license](LICENSE) verbatim (reducing
     text duplication)
  3. It allows to include configuration identification (e.g., git
     commit IDs)

### Makefile

The [`Makefile`](Makefile) assumes that you have an Emerald compiler
in `../old-emerald/` (relative to this repository), and executes the
bash template for you.

## Development

### Building

The [`Makefile`](Makefile) assumes that you have an Emerald compiler
in `../old-emerald/` (relative to this repository).

You can override this as follows:

```
$ make EMERALD_PATH="<some other path> <target>"
```

As for the possible `<target>`s, see below.

#### vim

Type `make vim` to make `build/emerald.vim`.

#### Listings package for LaTeX

Type `make listings` to make `build/listings-emerald.tex`

### Bumping Versions

This repository uses the Python library
[`bumpversion`](https://github.com/peritus/bumpversion) to bump
versions in a structured manner. For instance, `bumpversion` allows to
both issue a commit, add a tag, and update the
[`README.md`](README.md) at the same time.
