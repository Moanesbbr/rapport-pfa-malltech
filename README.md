# Malltech Internship Report — LaTeX Project
## TEK-UP / Anter Lab — Second-Year Internship

---

## Project Structure

```
malltech_report/
├── main.tex                          ← Root file (compile this)
├── global_config.tex                 ← YOUR INFO: name, supervisors, abstracts
├── biblio.bib                        ← References
│
├── introduction.tex                  ← General Introduction
├── chapter-01-project-framework.tex  ← Chapter 1
├── chapter-02-requirements.tex       ← Chapter 2
├── chapter-03-design.tex             ← Chapter 3
├── chapter-04-implementation.tex     ← Chapter 4
├── chapter-05-testing-deployment.tex ← Chapter 5
├── conclusion.tex                    ← General Conclusion
│
├── dedication.tex                    ← Dedication page
├── acknowledgements.tex              ← Acknowledgements
├── acronyms.tex                      ← List of abbreviations
│
├── tpl/
│   ├── tekup_internship.cls          ← Custom LaTeX class
│   ├── new_commands.tex              ← Custom commands & variables
│   ├── cover_page.tex                ← Front cover
│   └── resume.tex                    ← Abstract back page
│
└── img/
    ├── tekup.png                     ← TEK-UP logo (ADD THIS)
    └── (your screenshots here)
```

---

## Step 1 — Fill in YOUR Details

Open **`global_config.tex`** and update:
- `\author{}` — your full name
- `\proFramerName{}` — professional supervisor name
- `\academicFramerName{}` — academic supervisor name
- `\speciality{}` — your speciality (e.g. Computer Science)
- `\diplomaName{}` — your diploma name
- `\collegeYear{}` — e.g. `2024 -- 2025`
- `\englishAbstract{}` and `\frenchAbstract{}` — your abstracts
- `\englishAbstractKeywords{}` and `\frenchAbstractKeywords{}`

---

## Step 2 — Add Images

Place the following in the `img/` folder:
- `tekup.png` — the official TEK-UP logo (download from TEK-UP website)
- Your project screenshots (referenced as `\includegraphics{img/yourfile.png}`)

---

## Step 3 — Replace Diagram Placeholders

Search for `[DIAGRAM PLACEHOLDER]` or `\fbox{\parbox{...}}` blocks throughout
the chapter files and replace them with your actual figures:

```latex
\begin{figure}[H]
\centering
\includegraphics[width=0.9\columnwidth]{img/architecture_diagram.png}
\caption{High-level deployment architecture of Malltech}
\label{fig:architecture}
\end{figure}
```

---

## Step 4 — Compile

### Using Overleaf (recommended for beginners)
1. Create a new project → Upload Files
2. Upload the entire folder contents
3. Set compiler to **pdflatex**
4. Set main document to `main.tex`
5. Click Compile

### Using the command line (TeXLive / MikTeX)
```bash
cd malltech_report/
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex
```

Or with `latexmk` (handles all passes automatically):
```bash
latexmk -pdf main.tex
```

---

## Notes

- The `[SCREENSHOT NEEDED]` comments in the `.tex` files mark where to insert
  your actual application screenshots.
- Diagrams (use case, architecture, ERD, sequence) should be created in draw.io
  or Lucidchart, exported as PNG/PDF, and inserted with `\includegraphics`.
- The class uses `biblatex` with `bibtex` backend — run `bibtex main` between
  `pdflatex` passes.
- To add more references, edit `biblio.bib` in BibTeX format.
