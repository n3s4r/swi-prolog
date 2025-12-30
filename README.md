# SWI-Prolog Essentials

This repository serves as a general reference and template for developing logic programs with **SWI-Prolog**.

## 🛠 Getting Started

### Installation
* **Official:** [Download SWI-Prolog](https://www.swi-prolog.org/download/stable)
* **Homebrew (macOS):** `brew install swi-prolog`
* **Linux (Ubuntu):** `sudo apt install swipl`

### The Development Workflow
1. **Write** your facts and rules in a `.pl` file.
2. **Load** the file: `swipl your_file.pl`
3. **Query** the database in the interactive shell.
4. **Reload** after changes: Run `make.` in the Prolog shell.

---

## 📋 Common Commands & Syntax

### Interactive Shell (REPL)
| Command | Action |
| :--- | :--- |
| `halt.` | Exit the Prolog shell. |
| `listing.` | Display all currently loaded predicates. |
| `[file].` | Short for `consult(file).` (loads your code). |
| `make.` | Reloads all modified files. |
| `;` | Find the next solution (after a query). |
| `.` | Stop looking for solutions. |

### Syntax Basics
* **Atoms:** Start with lowercase (e.g., `apple`, `thomas`).
* **Variables:** Start with Uppercase or underscore (e.g., `X`, `Result`, `_temp`).
* **Facts:** Assertions of truth (e.g., `parent(bob, alice).`).
* **Rules:** Conditional truths (e.g., `ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).`).

---

## 🧩 Recommended Project Structure
If you are building a modular Prolog application, consider this layout:

```text
├── src/
│   ├── main.pl        # Entry point
│   ├── logic.pl       # Core rules and logic
│   └── data.pl        # Facts and Knowledge Base
├── tests/
│   └── unit_tests.pl  # PlUnit test cases
└── README.md
