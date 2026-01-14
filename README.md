<div align="center">
  <h1>Prolog Exercises</h1>
  <p>Logic programming exercises in <strong>Prolog</strong></p>

![Arch](https://img.shields.io/badge/Arch-1793D1?logo=archlinux&logoColor=1793D1&labelColor=fff&color=1793D1)
![Prolog](https://img.shields.io/badge/Prolog-E61B23?logo=prolog&logoColor=E61B23&labelColor=fff&color=E61B23)
![SWI-Prolog](https://img.shields.io/badge/SWI--Prolog-E61B23?logo=swiprolog&logoColor=E61B23&labelColor=fff&color=E61B23)

</div>

## Description

This repository contains programming exercises in **Prolog** using the logic programming paradigm. Practical examples include:

- Facts, Rules and Conclusions (`FRC`).
- Logical reasoning and inferences.
- Declarative programming and recursion.
- Queries and predicate unification.

## Exercises

| #   | Exercise                  | Level | Description                                                     |
| --- | ------------------------- | ----- | --------------------------------------------------------------- |
| 1   | **Animal Hierarchy**      | 🟢    | Hierarchical relationship of animals (dogs, cats).              |
| 2   | **Human Responsibility**  | 🟢    | Relationship of responsibility based on conscience and freedom. |
| 3   | **Activities by Weather** | 🟢    | Relationship between activities based on weather.               |
| 4   | **Thieves and Jewels**    | 🟡    | Relationship between thieves, merchants, jewels and metals.     |
| 5   | **School System**         | 🟡    | Relationships between teachers, students and subjects.          |
| 6   | **X-Men Combat**          | 🟡    | Relationships of mutants with levels and powers.                |
| 7   | **Multiplication Table**  | 🟡    | Recursive multiplication table generator.                       |
| 8   | **General Menu**          | 🔴    | Menu to access different recursive programs.                    |

## Installation Requirements

- **Operating System**: Arch Linux or WSL2 on Windows.
- **Architecture**: x86-64 (64-bit).
- **SWI-Prolog**: version 10.0.0 or higher.
- **Just command runner**: version 1.46.0 or higher.

## Execution Instructions

### Arch Linux/WSL (Recommended)

1. **Clone the repository**:
   ```bash
   git clone https://github.com/edavnix/prolog-logic-fundamentals.git
   ```
   > **Note**: When using Arch Linux natively, proceed to **Step 4**. For Windows environments, complete all steps to install and configure WSL Arch.
2. **Download and install WSL Arch** (PowerShell):
   ```bash
   wsl --install -d archlinux
   ```
3. **Restart the system** and access Arch Linux.
4. **Install SWI-Prolog and Just**:
   ```bash
   pacman -Syu
   pacman -S swi-prolog just
   ```
5. **Verify installation**:
   ```bash
   swipl --version    # e.g. SWI-Prolog version 10.0.0
   just --version     # e.g. just 1.46.0
   ```
6. **Navigate to the directory**:
   ```bash
   cd prolog-logic-fundamentals
   ```
7. **Execute exercises** use `just run` followed by the file name or path:
   ```bash
   just                                   # view available commands
   just list                              # display exercises
   just run 01_animal_hierarchy.pl        # practical example by file name
   just run src/01_animal_hierarchy.pl    # practical example by full path
   just check                             # verify that all exercises compile
   ```

### OneCompiler (No Installation Required)

Code execution without local installation:

1. Access **[OneCompiler - Prolog](https://onecompiler.com/prolog)**.
2. Copy and paste the exercise code.
3. For exercises requiring input:
   - Navigate to the **STDIN** panel.
   - Enter values separated by spaces.
4. Click **Run**.

## Official Documentation

Additional resources:

- **[SWI-Prolog Documentation](https://www.swi-prolog.org/pldoc/index.html)** - Complete SWI-Prolog manual.
- **[Learn Prolog Now!](https://www.let.rug.nl/bos/lpn//lpnpage.php)** - Interactive Prolog tutorial.

<div align="center">
  <br>
  <img
    src="https://img.shields.io/badge/Made%20with-Prolog%20%26%20Logic-E61B23?style=for-the-badge"
    alt="Made with Prolog"
  />
  <br><br>
  <p>⭐ <strong>Star this repository to show support</strong> ⭐</p>
</div>
