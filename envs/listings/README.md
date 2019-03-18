# An Emerald Language Definition For `listings`

[`listings`](https://www.ctan.org/pkg/listings) is a LaTeX package for
including source code listings into your LaTeX document.

The Emerald language definition is given in a single `.tex` file:
[`listings-emerald.tex`](https://github.com/emerald/modes/releases/download/v2019.0.1/listings-emerald.tex).

In general, the file has the following structure:
```
\lstdefinelanguage{emerald}
{
  ...
}
```

Hence, you should use it, roughly, as follows:
```
\usepackage{listings}
\input{listings-emerald} % An Emerald language definition
```

If most of your code will be Emerald code, you might as well also do
this:
```
\lstset{language=emerald} % Set Emerald as the default language
```
If you do the above, then you can ignore all the occurrences of
`[language=emerald]` below.

To include a code block, use:

```
\begin{lstlisting}[language=emerald]
...
\end{lstlisting}
```

To include some code inline (e.g., when discussing an Emerald
keyword), use:

```
\lstinline[language=emerald]^...^
```
Note, we use `^` around the Emerald code since `^` is not an element
of Emerald syntax. It may however be an element of your Emerald
strings, or characters. In that case, you should pick a different
delimiter. `\lstinline` accepts any character as the delimiter: it
looks for the first subsequent occurrence of the first character (in
this case, `^`).

To include code from a file (probably the best option), use:

```
\lstinputlisting[language=emerald]{filepath.m}
```

For more about the `listings` package, see [the package documentation
on CTAN](https://www.ctan.org/pkg/listings).

## Installing

### Manual

  1. Download the [latest release of `listings-emerald.tex`](https://github.com/emerald/modes/releases/download/v2019.0.1/listings-emerald.tex),
     and place it in your working LaTeX directory.
