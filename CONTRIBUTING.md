# Contributing to BondForge v2.0.0

First off, thank you for considering contributing to BondForge! Your contributions help forge better tools for the entire structural biology community. 🔥

---

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Setup](#development-setup)
- [Coding Standards](#coding-standards)
- [Testing Guidelines](#testing-guidelines)
- [Documentation](#documentation)
- [Scientific Accuracy](#scientific-accuracy)
- [Commit Guidelines](#commit-guidelines)
- [Pull Request Process](#pull-request-process)

---

## Code of Conduct

This project and everyone participating in it is governed by our commitment to fostering an open, welcoming, and respectful environment. We expect all contributors to:

- Be respectful and professional
- Welcome newcomers and help them get started
- Accept constructive criticism gracefully
- Focus on what's best for the community
- Show empathy towards others

---

## How Can I Contribute?

### 🐛 Reporting Bugs

Before creating bug reports, please check existing issues to avoid duplicates.

**Great bug reports include:**
- **Clear, descriptive title**
- **Exact steps to reproduce** the problem
- **Specific examples** (code snippets, PDB files if reasonable size)
- **Expected vs actual behavior**
- **Environment details**:
  - BondForge version: `bondforge --version`
  - Python version: `python --version`
  - OS and version
  - BioPython version
  - Installation method

**Bug Report Template:**
```markdown
## Bug Description
Brief description of the issue

## Steps to Reproduce
1. Run command `bondforge analyze ...`
2. See error

## Expected Behavior
What should happen

## Actual Behavior
What actually happens

## Environment
- BondForge: 2.0.0
- Python: 3.9.5
- OS: Ubuntu 20.04
- BioPython: 1.79

## Additional Context
Error messages, screenshots, etc.
```

### 💡 Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues.

**Great enhancement suggestions include:**
- **Clear, descriptive title**
- **Detailed description** of the enhancement
- **Rationale**: Why would this be useful?
- **Scientific references** if applicable
- **Example usage** showing how it would work
- **Implementation ideas** if you have them

**Enhancement Template:**
```markdown
## Enhancement Description
What feature would you like to see?

## Motivation
Why is this needed?

## Proposed Solution
How should it work?

## Alternatives Considered
What other approaches did you consider?

## Scientific References
Any relevant papers or methods
```

### 📝 Improving Documentation

Documentation improvements are always welcome!

- Fix typos or clarify confusing sections
- Add examples and tutorials
- Improve API documentation
- Translate documentation (future)
- Add diagrams and figures

### 🔧 Code Contributions

See [Pull Request Process](#pull-request-process) below.

---

## Development Setup

### 1. Fork and Clone

```bash
# Fork on GitHub, then clone your fork
git clone https://github.com/YOUR-USERNAME/BondForge.git
cd BondForge

# Add upstream remote
git remote add upstream https://github.com/AyehBlk/BondForge.git
```

### 2. Create Development Environment

```bash
# Create virtual environment
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# Install in development mode with all extras
pip install -e ".[dev,docs,viz,all]"

# Install pre-commit hooks (recommended)
pre-commit install
```

### 3. Create Feature Branch

```bash
# Update main branch
git checkout main
git pull upstream main

# Create feature branch
git checkout -b feature/your-feature-name
```

### 4. Make Changes

```bash
# Make your changes
# Add tests
# Update documentation

# Run tests
pytest tests/

# Run linters
black src/
flake8 src/
mypy src/

# Commit changes
git add .
git commit -m "Add feature: description"
```

### 5. Submit Pull Request

```bash
# Push to your fork
git push origin feature/your-feature-name

# Open Pull Request on GitHub
```

---

## Coding Standards

### Python Style Guide

We follow **PEP 8** with some modifications:

- Maximum line length: **100 characters** (not 79)
- Use **type hints** for all public functions
- Use **meaningful variable names** (not single letters except for loops)
- Use **docstrings** for all public functions/classes
- Prefer **clarity over cleverness**

### Code Organization

```python
"""
Module docstring explaining purpose.

Author: Your Name
Email: your.email@example.com
"""

# Standard library imports
import os
import sys
from pathlib import Path
from typing import List, Dict, Optional

# Third-party imports
import numpy as np
import pandas as pd
from Bio.PDB import PDBParser

# Local imports
from bondforge.config import get_config
from bondforge.utils import calculate_distance

# Constants
DEFAULT_CUTOFF = 3.5
MAX_INTERACTIONS = 10000

# Classes and functions
class MyAnalyzer:
    """Brief description."""
    
    def __init__(self, ...):
        """Initialize analyzer."""
        pass
    
    def analyze(self, ...) -> Dict:
        """
        Analyze something.
        
        Parameters:
        -----------
        param1 : type
            Description
        
        Returns:
        --------
        dict
            Results dictionary
        """
        pass
```

### Type Hints

Always use type hints for public functions:

```python
from typing import List, Dict, Optional, Tuple

def find_interactions(
    structure: Structure,
    cutoff: float = 3.5,
    types: Optional[List[str]] = None
) -> Dict[str, List[Interaction]]:
    """
    Find interactions in structure.
    
    Parameters:
    -----------
    structure : Bio.PDB.Structure.Structure
        Protein structure
    cutoff : float
        Distance cutoff in Angstroms
    types : list of str, optional
        Interaction types to find
    
    Returns:
    --------
    dict
        Dictionary mapping type to list of interactions
    """
    pass
```

### Documentation

Use **Google-style docstrings**:

```python
def calculate_energy(
    distance: float,
    angle: float,
    method: str = 'simple'
) -> float:
    """
    Calculate interaction energy.
    
    Uses quantum mechanical corrections when method='advanced'.
    
    Parameters:
    -----------
    distance : float
        Distance in Angstroms
    angle : float
        Angle in degrees
    method : str, optional
        Calculation method: 'simple' or 'advanced'
        Default: 'simple'
    
    Returns:
    --------
    float
        Energy in kcal/mol
        Negative values indicate favorable interactions
    
    Raises:
    -------
    ValueError
        If distance is negative or angle out of range
    
    Examples:
    ---------
    >>> energy = calculate_energy(2.9, 165)
    >>> print(f"Energy: {energy:.2f} kcal/mol")
    Energy: -3.45 kcal/mol
    
    Notes:
    ------
    The advanced method uses quantum mechanical corrections
    based on Morokuma decomposition [1]_.
    
    References:
    -----------
    .. [1] Morozov & Kortemme (2006) PNAS
    """
    if distance < 0:
        raise ValueError("Distance must be non-negative")
    
    if not 0 <= angle <= 180:
        raise ValueError("Angle must be between 0 and 180 degrees")
    
    # Implementation...
    return energy_value
```

---

## Testing Guidelines

### Writing Tests

We use **pytest** for testing. All new features must include tests.

#### Unit Test Example

```python
# tests/unit/test_energy_calculator.py

import pytest
from bondforge.energy_calculator import AdvancedEnergyCalculator

class TestAdvancedEnergyCalculator:
    """Tests for AdvancedEnergyCalculator."""
    
    @pytest.fixture
    def calculator(self):
        """Create calculator instance."""
        return AdvancedEnergyCalculator(force_field='amber')
    
    def test_hydrogen_bond_energy(self, calculator):
        """Test H-bond energy calculation."""
        energy = calculator.calculate_hydrogen_bond_energy(
            donor_atom='N',
            acceptor_atom='O',
            distance=2.9,
            angle=165
        )
        
        # Check energy is favorable (negative)
        assert energy.total < 0
        
        # Check energy is reasonable
        assert -10 < energy.total < 0
        
        # Check components exist
        assert energy.electrostatic is not None
        assert energy.polarization is not None
    
    def test_energy_distance_dependence(self, calculator):
        """Test energy decreases with distance."""
        energy1 = calculator.calculate_hydrogen_bond_energy(
            'N', 'O', distance=2.8, angle=165
        )
        energy2 = calculator.calculate_hydrogen_bond_energy(
            'N', 'O', distance=3.5, angle=165
        )
        
        # Closer should be stronger (more negative)
        assert energy1.total < energy2.total
    
    @pytest.mark.parametrize("distance,angle,expected_range", [
        (2.8, 165, (-5, -2)),
        (3.5, 165, (-2, 0)),
        (2.9, 120, (-4, -1)),
    ])
    def test_energy_ranges(self, calculator, distance, angle, expected_range):
        """Test energy falls in expected ranges."""
        energy = calculator.calculate_hydrogen_bond_energy(
            'N', 'O', distance=distance, angle=angle
        )
        
        min_e, max_e = expected_range
        assert min_e <= energy.total <= max_e
```

#### Integration Test Example

```python
# tests/integration/test_full_pipeline.py

import pytest
from pathlib import Path
from bondforge import ExtendedProteinInteractionAnalyzer

class TestFullPipeline:
    """Integration tests for complete analysis pipeline."""
    
    @pytest.fixture
    def test_structure(self, tmp_path):
        """Create test PDB file."""
        pdb_file = tmp_path / "test.pdb"
        # Create minimal valid PDB
        # (in practice, use a real test structure)
        return str(pdb_file)
    
    def test_complete_analysis(self, test_structure):
        """Test complete analysis pipeline."""
        # Initialize
        analyzer = ExtendedProteinInteractionAnalyzer(test_structure)
        
        # Analyze
        results = analyzer.analyze_all_interactions()
        
        # Check results structure
        assert 'total_interactions' in results
        assert 'by_type' in results
        assert isinstance(results['total_interactions'], int)
        
        # Check some interactions found
        assert results['total_interactions'] > 0
    
    def test_export_formats(self, test_structure, tmp_path):
        """Test exporting to different formats."""
        analyzer = ExtendedProteinInteractionAnalyzer(test_structure)
        
        # Export CSV
        csv_file = tmp_path / "interactions.csv"
        analyzer.export_to_csv(str(csv_file))
        assert csv_file.exists()
        
        # Export JSON
        json_file = tmp_path / "interactions.json"
        analyzer.export_to_json(str(json_file))
        assert json_file.exists()
```

### Running Tests

```bash
# Run all tests
pytest tests/

# Run with coverage
pytest tests/ --cov=src/bondforge --cov-report=html

# Run specific test file
pytest tests/unit/test_energy_calculator.py

# Run with verbose output
pytest tests/ -v -s

# Run only fast tests (skip slow integration tests)
pytest tests/ -m "not slow"

# Run in parallel
pytest tests/ -n auto
```

### Test Coverage

- Aim for **>80% code coverage**
- All new functions must have tests
- Test edge cases and error conditions
- Use fixtures for common setup

---

## Scientific Accuracy

### Adding New Interaction Types

When proposing a new interaction type:

1. **Provide scientific references**
   - At least 2-3 peer-reviewed papers
   - Crystallographic studies preferred
   - Experimental validation data

2. **Define clear criteria**
   - Distance cutoffs with justification
   - Angle requirements if applicable
   - Geometric constraints
   - Energy estimates

3. **Explain biological relevance**
   - Why is this interaction important?
   - Where does it commonly occur?
   - What role does it play?

4. **Validate on real structures**
   - Test on known examples
   - Compare with manual analysis
   - Check against other tools

**Example Proposal:**
```markdown
## Proposal: Add Lone Pair-π Interactions

### Scientific Basis
1. Egli & Gessner (1995) PNAS - First description
2. Mooibroek et al. (2008) Cryst. Growth Des. - Comprehensive review
3. Cheng et al. (2019) J. Phys. Chem. - Energy calculations

### Geometric Criteria
- Distance: O(lone pair)...π centroid < 3.5 Å
- Angle: O-C-centroid > 160° (near perpendicular)
- Aromatic ring must be electron-deficient

### Biological Relevance
- Stabilizes protein-DNA complexes
- Found in ~15% of high-resolution structures
- Important for specificity in enzyme active sites

### Test Cases
- PDB: 1ABC (known example in active site)
- PDB: 2XYZ (protein-DNA interface)

### Implementation Plan
```python
def find_lone_pair_pi_interactions(self, distance_cutoff=3.5):
    # Implementation with detailed comments
    pass
```
```

### Algorithm Modifications

When modifying existing algorithms:

1. **Document scientific basis** for changes
2. **Preserve backward compatibility** or document breaking changes
3. **Compare with existing implementations** when available
4. **Validate against experimental data**
5. **Include references** in code comments

---

## Commit Guidelines

### Commit Message Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Formatting changes (no code change)
- `refactor`: Code refactoring
- `test`: Adding or modifying tests
- `chore`: Maintenance tasks

**Examples:**
```
feat(energy): add QM corrections for H-bonds

Implements Morokuma energy decomposition for hydrogen bonds
based on Morozov & Kortemme (2006). Includes electrostatic,
polarization, charge transfer, dispersion, and exchange-repulsion
components.

Fixes #123
Refs #124

---

fix(cli): correct argument parsing for batch command

The --parallel flag was not being properly passed to the
batch processor. This fixes the issue and adds a test.

Fixes #125

---

docs(quickstart): add CLI examples for v2.0.0

Updates quickstart guide with new CLI commands and options
introduced in version 2.0.0.
```

### Branch Naming

- `feature/` - New features
- `bugfix/` - Bug fixes
- `hotfix/` - Critical fixes
- `docs/` - Documentation updates
- `test/` - Test additions
- `refactor/` - Code refactoring

**Examples:**
- `feature/lone-pair-pi-interactions`
- `bugfix/hydrogen-bond-angle-calculation`
- `docs/cli-reference-update`
- `test/energy-calculator-edge-cases`

---

## Pull Request Process

### 1. Before Submitting

- [ ] Code follows style guidelines
- [ ] Tests added and passing
- [ ] Documentation updated
- [ ] CHANGELOG.md updated (if needed)
- [ ] No merge conflicts with main
- [ ] Commit messages follow guidelines

### 2. Pull Request Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix (non-breaking change)
- [ ] New feature (non-breaking change)
- [ ] Breaking change (fix or feature that breaks existing functionality)
- [ ] Documentation update

## Testing
Describe tests you ran to verify changes

## Checklist
- [ ] Code follows project style
- [ ] Self-reviewed code
- [ ] Commented complex sections
- [ ] Updated documentation
- [ ] Added tests
- [ ] Tests pass locally
- [ ] No new warnings

## Related Issues
Fixes #(issue number)

## Scientific Validation
(If applicable) Reference papers, validation methods, etc.
```

### 3. Review Process

1. **Automated checks run** (CI/CD)
2. **Maintainer review** (usually within 2-3 days)
3. **Address feedback** if any
4. **Approval** from at least one maintainer
5. **Merge** by maintainer

### 4. After Merge

- Delete your feature branch
- Update your fork
- Close related issues

---

## Development Tools

### Recommended IDE Setup

**VSCode** (recommended):
```json
// .vscode/settings.json
{
    "python.linting.enabled": true,
    "python.linting.flake8Enabled": true,
    "python.linting.mypyEnabled": true,
    "python.formatting.provider": "black",
    "python.formatting.blackArgs": ["--line-length", "100"],
    "editor.formatOnSave": true,
    "files.exclude": {
        "**/__pycache__": true,
        "**/*.pyc": true
    }
}
```

### Pre-commit Hooks

We use pre-commit hooks to ensure code quality:

```yaml
# .pre-commit-config.yaml
repos:
  - repo: https://github.com/psf/black
    rev: 22.3.0
    hooks:
      - id: black
        args: [--line-length=100]
  
  - repo: https://github.com/PyCQA/flake8
    rev: 4.0.1
    hooks:
      - id: flake8
        args: [--max-line-length=100]
  
  - repo: https://github.com/pre-commit/mirrors-mypy
    rev: v0.950
    hooks:
      - id: mypy
```

---

## Recognition

Contributors will be acknowledged in:
- **README.md** - Contributors section
- **CHANGELOG.md** - Version notes
- **Release notes** - GitHub releases
- **Documentation** - Contributors page (planned)

Significant contributors may become maintainers!

---

## Questions?

- 💬 **Discussions**: [GitHub Discussions](https://github.com/AyehBlk/BondForge/discussions)
- 📧 **Email**: ayehbolouki1988@gmail.com or ayehgeek@gmail.com
- 📝 **Issues**: For bugs and feature requests

---

## License

By contributing, you agree that your contributions will be licensed under the **MIT License**.

---

## Thank You! 🙏

Every contribution, no matter how small, makes BondForge better for the entire community. Whether you're fixing a typo, adding a feature, or reporting a bug, your help is invaluable.

**Together, we're forging better tools for structural biology!** 🔥🧬

---

*Made with 🔥 by the structural biology community, for the community*
