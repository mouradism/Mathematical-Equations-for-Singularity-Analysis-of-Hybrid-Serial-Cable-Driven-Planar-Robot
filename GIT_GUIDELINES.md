# Git Commit Guidelines

## Commit Message Format

Use the following format for clear, descriptive commit messages:

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Type
- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation changes
- **style**: Code style changes (formatting, missing semicolons, etc.)
- **refactor**: Code refactoring without feature changes
- **perf**: Performance improvements
- **test**: Adding or updating tests
- **chore**: Build process, dependency updates, etc.
- **content**: Adding or updating content (equations, analysis, etc.)

### Scope
- `equations`: Changes to equations.tex
- `cable-tension`: Changes to cable_tension_analysis.tex
- `notation`: Changes to notation_appendix.tex
- `robot-diagram`: Changes to robot_diagram.tex
- `python`: Changes to Python implementation
- `docs`: Documentation updates
- `build`: Build-related changes

### Subject
- Use imperative, present tense: "add" not "added" or "adds"
- Don't capitalize first letter
- No period (.) at the end
- Limit to 50 characters

### Body
- Explain what and why, not how
- Use imperative, present tense
- Wrap at 72 characters
- Separate from subject with blank line

### Footer
- Reference issues: "Fixes #123", "Closes #456"
- Breaking changes: "BREAKING CHANGE: description"

## Examples

### Example 1: Adding a feature
```
feat(cable-tension): add formal algorithm for tension computation

Implement Algorithm 1 for computing cable tensions with:
- Force equilibrium equations
- LU decomposition solution method
- Singularity detection
- Feasibility assessment

Fixes #42
```

### Example 2: Bug fix
```
fix(equations): correct degree symbol formatting in math mode

Replace Unicode degree symbol (°) with LaTeX ^{\circ} notation
for proper rendering in all PDF viewers.

Fixes #15
```

### Example 3: Documentation
```
docs(notation): add Cable Geometry Jacobian definition

Include detailed explanation of $\bm{G}_{\rho}$ matrix and its role
in tension computation. Add physical interpretation and computational
considerations.
```

### Example 4: Content update
```
content(cable-tension): add numerical example for tension analysis

Include worked example with:
- Specific joint configuration (q1=30°, q2=45°)
- External load vector
- Step-by-step calculations
- Result interpretation showing feasible vs infeasible case
```

## Branching Strategy

Use the following branch naming convention:

- `main`: Production-ready, stable version
- `develop`: Development branch for integration
- `feature/<name>`: New features (e.g., `feature/workspace-analysis`)
- `fix/<name>`: Bug fixes (e.g., `fix/notation-consistency`)
- `docs/<name>`: Documentation updates (e.g., `docs/algorithm-details`)
- `refactor/<name>`: Code refactoring (e.g., `refactor/cable-tension-solver`)

## Workflow

1. **Create a feature branch** from `develop`:
   ```bash
   git checkout -b feature/your-feature develop
   ```

2. **Make commits** with clear, descriptive messages:
   ```bash
   git add <files>
   git commit -m "feat(scope): description"
   ```

3. **Push your branch**:
   ```bash
   git push origin feature/your-feature
   ```

4. **Create a Pull Request** on GitHub/GitLab for code review

5. **Merge to develop** after review approval

6. **Release to main** when ready for production

## Useful Git Commands

### Status and Information
```bash
git status                          # Show working tree status
git log --oneline -n 10            # Show last 10 commits
git log --graph --decorate --all   # Show branch graph
git diff                            # Show unstaged changes
git diff --cached                   # Show staged changes
```

### Staging and Committing
```bash
git add <file>                      # Stage specific file
git add .                           # Stage all changes
git commit -m "message"             # Commit with message
git commit --amend                  # Modify last commit
```

### Branching
```bash
git branch                          # List local branches
git branch -a                       # List all branches
git checkout -b <branch>           # Create and switch to branch
git switch <branch>                 # Switch to existing branch
git branch -d <branch>             # Delete local branch
```

### History and Undoing
```bash
git log                             # Show commit history
git show <commit>                   # Show specific commit
git revert <commit>                 # Create inverse commit
git reset --hard <commit>           # Hard reset to commit
git reflog                          # Show all history changes
```

### Remote Operations
```bash
git remote -v                       # List remotes
git fetch origin                    # Fetch from remote
git pull origin <branch>            # Pull from remote
git push origin <branch>            # Push to remote
```

## Best Practices

1. **Commit frequently** with logical, atomic changes
2. **Write descriptive messages** - future you will thank you
3. **Review before committing** - use `git diff` and `git status`
4. **Pull before push** - avoid conflicts and stay synchronized
5. **Don't commit sensitive data** - use `.gitignore` for secrets
6. **Use branches** - keep main/develop clean
7. **Squash when appropriate** - combine related commits before merging
8. **Never force push to shared branches** - use `--force` only on personal branches

## Tags for Releases

Create tags for major milestones:
```bash
git tag -a v1.0.0 -m "Initial release: Complete mathematical framework"
git push origin v1.0.0
```

Tag format: `v<major>.<minor>.<patch>` following semantic versioning
