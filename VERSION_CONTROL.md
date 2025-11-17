# Version Control Workflow

## Repository Status

**Repository**: Local Git repository initialized
**Initial Commit**: `a9296f6` - Initial project structure with comprehensive mathematical framework
**Main Branch**: `master`

## Current Project Structure in Git

```
.
├── .git/                           # Git repository metadata
├── .gitignore                      # Files to ignore in version control
├── .gitattributes                  # Cross-platform line ending settings
├── GIT_GUIDELINES.md              # This file - Git workflow guidelines
├── VERSION_CONTROL.md             # This document
├── README.md                       # Project overview
├── CONSISTENCY_ANALYSIS.md        # Mathematical consistency analysis
├── DIAGRAM_CONSISTENCY_CHECK.md   # Visual diagram validation
├── equations.tex                   # Main LaTeX document (53 pages)
├── cable_tension_analysis.tex     # Cable tension analysis module
├── notation_appendix.tex          # Standardized notation reference
├── robot_diagram.tex              # Robot schematic TikZ diagram
└── requirements.txt               # Python dependencies
```

## Tracked Files

- **LaTeX Documents**: 4,014 insertions tracked
- **Configuration Files**: `.gitignore`, `.gitattributes`, `GIT_GUIDELINES.md`
- **Documentation**: `README.md`, analysis reports
- **Dependencies**: `requirements.txt`

## Ignored Files

The following file types are **not** tracked (see `.gitignore`):
- LaTeX build artifacts: `*.pdf`, `*.aux`, `*.log`, `*.toc`, etc.
- Python cache: `__pycache__/`, `*.pyc`, `*.egg-info/`
- IDE files: `.vscode/`, `.idea/`, `*.swp`
- OS files: `.DS_Store`, `Thumbs.db`
- Jupyter notebooks: `.ipynb_checkpoints/`

## Getting Started with Git

### 1. Check current status
```bash
git status
```

### 2. View commit history
```bash
git log --oneline -n 5
git log --graph --decorate --oneline --all
```

### 3. Create a new feature branch
```bash
# For implementing new algorithms
git checkout -b feature/singularity-detection

# For bug fixes
git checkout -b fix/notation-consistency

# For documentation updates
git checkout -b docs/algorithm-documentation
```

### 4. Make changes and commit
```bash
# Edit files...
git add equations.tex cable_tension_analysis.tex
git commit -m "feat(cable-tension): add comprehensive tension algorithm

Includes matrix formulation, numerical example, and Python implementation."
```

### 5. View changes before committing
```bash
git diff                  # Unstaged changes
git diff --cached         # Staged changes
git diff HEAD~1           # Compare to previous commit
```

## Typical Workflow

### Scenario 1: Adding a new feature

```bash
# 1. Create feature branch from master
git checkout -b feature/workspace-analysis master

# 2. Make commits with clear messages
git add equations.tex
git commit -m "feat(workspace): implement workspace boundary detection algorithm"

git add cable_tension_analysis.tex
git commit -m "feat(workspace): add numerical examples for workspace computation"

# 3. View branch history
git log --oneline feature/workspace-analysis

# 4. Switch back to master when ready
git checkout master
git merge feature/workspace-analysis

# 5. Delete feature branch after merging
git branch -d feature/workspace-analysis
```

### Scenario 2: Fixing a bug

```bash
# 1. Create fix branch
git checkout -b fix/notation-inconsistency master

# 2. Make minimal changes to fix the issue
git add notation_appendix.tex
git commit -m "fix(notation): standardize transformation matrix notation

Replace T_i_j with T_j^i convention throughout document."

# 3. Merge to master
git checkout master
git merge fix/notation-inconsistency
```

### Scenario 3: Updating documentation

```bash
# 1. Create docs branch
git checkout -b docs/implementation-guide master

# 2. Add documentation
git add README.md GIT_GUIDELINES.md
git commit -m "docs(readme): add Python implementation guide

Include setup instructions, algorithm descriptions, and examples."

# 3. Merge back
git checkout master
git merge docs/implementation-guide
```

## Important Commands

### Viewing Information
```bash
git log                          # Full commit history
git log --oneline -n 10         # Last 10 commits, short format
git log --stat                   # With file statistics
git log --patch                  # With actual changes
git show <commit>               # Show specific commit details
git diff HEAD                    # Changes since last commit
git status                       # Current working directory status
```

### Staging and Committing
```bash
git add <file>                  # Stage specific file
git add .                       # Stage all changes
git add -p                      # Interactive staging (patch mode)
git commit -m "message"         # Commit with message
git commit --amend              # Modify last commit
git reset HEAD <file>           # Unstage file
git checkout -- <file>          # Discard changes to file
```

### Branching
```bash
git branch                      # List local branches
git branch -a                   # List all branches
git branch -v                   # Show last commit on each branch
git checkout -b <new-branch>   # Create and switch to branch
git checkout <branch>           # Switch to branch
git branch -d <branch>         # Delete branch
git branch -m <old> <new>      # Rename branch
```

### Merging and Rebasing
```bash
git merge <branch>              # Merge branch into current
git merge --no-ff <branch>     # Merge with merge commit
git rebase <branch>             # Rebase current branch
git rebase -i HEAD~3           # Interactive rebase last 3 commits
```

### Undoing Changes
```bash
git revert <commit>             # Create inverse commit
git reset --soft HEAD~1         # Undo last commit, keep changes staged
git reset --mixed HEAD~1        # Undo last commit, keep changes unstaged
git reset --hard HEAD~1         # Undo last commit, discard changes
git reflog                       # Show history of all changes
git checkout <commit> -- <file> # Restore file from specific commit
```

## Commit Best Practices

### Good Commit Messages
✅ `feat(cable-tension): implement matrix inversion solution method`
✅ `fix(equations): correct cable angle calculation using atan2`
✅ `docs(readme): add Python implementation examples`
✅ `refactor(notation): standardize transformation matrix symbols`

### Bad Commit Messages
❌ `update files`
❌ `fixed stuff`
❌ `working on equations`
❌ `asdf`
❌ `more changes`

### Atomic Commits
- One logical change per commit
- Commits should be small enough to review easily
- Large changes should be split into multiple commits
- Related changes can be in one commit if they serve the same purpose

## Project Milestones

Track major versions using tags:

```bash
# Create release tag
git tag -a v1.0.0 -m "Release 1.0.0: Complete mathematical framework"

# List tags
git tag -l

# Show specific tag
git show v1.0.0

# Push tags to remote (when added)
git push origin --tags
```

## Collaboration Setup (Future)

When adding remote repository (GitHub/GitLab):

```bash
# Add remote
git remote add origin <repository-url>

# Set default branch
git branch -M main
git push -u origin main

# Clone repository
git clone <repository-url>
```

## Troubleshooting

### Undoing pushed commits
```bash
# Create inverse commit (safe for shared branches)
git revert <commit-hash>

# Force reset (only for personal branches!)
git push origin --force-with-lease <branch>
```

### Recovering deleted branches
```bash
# Find deleted branch commit
git reflog

# Restore branch
git checkout -b <branch> <commit>
```

### Resolving merge conflicts
```bash
# See conflicted files
git status

# Edit files to resolve conflicts

# Mark as resolved
git add <resolved-file>

# Complete merge
git commit -m "merge: resolve conflicts from feature/xyz"
```

## Next Steps

1. ✅ Git repository initialized
2. ✅ Initial commit created
3. ⏭️ Create feature branches for:
   - Python implementation
   - Algorithm development
   - Documentation
   - Testing and validation

4. ⏭️ Set up remote repository (GitHub/GitLab)
5. ⏭️ Add CI/CD pipeline for automated testing
6. ⏭️ Create release tags for versions
