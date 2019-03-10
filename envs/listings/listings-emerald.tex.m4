% This file was generated from an m4 template.
syscmd(`date -u --iso-8601=minutes |
  sed "s/^/% Generation date-time (ISO 8601): /"')dnl
syscmd(`./scripts/git-identity.sh . |
  sed "s/^/% /"')dnl

syscmd(`perl -pe "chomp if eof" LICENSE |
  sed "s/^/% /"')

\lstdefinelanguage{emerald}
{
 % Keywords and built-in types, as found in:
syscmd(`./scripts/git-identity.sh $EMERALD_PATH |
  sed "s/^/  % /"')dnl
  morekeywords={
syscmd(`./scripts/keywords.sh $EMERALD_PATH')dnl
  },
  moreemph={
syscmd(`./scripts/types-from-builtins.sh $EMERALD_PATH')dnl
  },
  % The other parts of the syntax spec, as found in other.vim:
syscmd(`cat other.tex |
  sed "s/^/  /"')dnl
}
