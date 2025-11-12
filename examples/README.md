# BondForge Examples

This directory contains comprehensive examples demonstrating how to use BondForge.

##  Available Examples

###  CLI Examples

**`cli_examples.sh`** - Shell script with CLI command examples
- Basic analysis
- Specific interaction types
- Advanced energy calculations
- Batch processing
- Structure comparison
- Custom configuration
- And more!

**Usage:**
```bash
chmod +x cli_examples.sh
./cli_examples.sh  # View all examples
```

###  Python API Examples

**`example_demo.py`** - Basic demonstration script
- Core analyzer (7 interaction types)
- Hub residue identification
- Result export
- Visualization

**Usage:**
```bash
python example_demo.py protein.pdb
```

**`comprehensive_example.py`** - Complete demonstration
- Core analyzer (7 types)
- Extended analyzer (20 types)
- Interface analysis
- Visualization generation
- All features demonstrated

**Usage:**
```bash
python comprehensive_example.py protein.pdb
```

##  Quick Start

### 1. Get Test Data

Download sample PDB files:
```bash
# Small protein for testing
wget https://files.rcsb.org/download/1ABC.pdb

# Or use any of your own PDB files
```

### 2. Run CLI Examples

```bash
# Basic analysis
bondforge analyze 1ABC.pdb

# With advanced features
bondforge analyze 1ABC.pdb --energy --parallel
```

### 3. Run Python Examples

```bash
# Simple demo
python example_demo.py 1ABC.pdb

# Comprehensive demo
python comprehensive_example.py 1ABC.pdb
```

##  Example Categories

### Basic Usage
- `cli_examples.sh` - Example 1: Basic analysis
- `example_demo.py` - Simple workflow

### Advanced Features
- `cli_examples.sh` - Example 3: Energy calculations
- `comprehensive_example.py` - All 20 interaction types

### Batch Processing
- `cli_examples.sh` - Example 4: Batch processing
- Multiple structure analysis

### Configuration
- `cli_examples.sh` - Example 6: Custom config
- YAML configuration examples

### Comparison Analysis
- `cli_examples.sh` - Example 5: Structure comparison
- Wild-type vs mutant

## 🎯 Example Outputs

All examples generate results in organized directories:

```
results/
├── interactions.csv          # All detected interactions
├── hubs.csv                  # Hub residues
├── critical_interactions.csv # Critical interactions
├── interaction_network.png   # Network visualization
└── visualize.pml             # PyMOL script
```

##  Creating Your Own Examples

### Template: Basic Analysis

```python
from bondforge import ExtendedProteinInteractionAnalyzer

# Load and analyze
analyzer = ExtendedProteinInteractionAnalyzer('protein.pdb')
results = analyzer.analyze_all_interactions()

# Print summary
print(f"Total interactions: {results['total_interactions']}")

# Export
analyzer.export_to_csv('results/')
```

### Template: Advanced Energy

```python
from bondforge import ExtendedProteinInteractionAnalyzer
from bondforge.energy_calculator import AdvancedEnergyCalculator

# Analyze
analyzer = ExtendedProteinInteractionAnalyzer('protein.pdb')
h_bonds = analyzer.find_hydrogen_bonds()

# Calculate energies
calc = AdvancedEnergyCalculator()
for bond in h_bonds:
    energy = calc.calculate_hydrogen_bond_energy(
        donor_atom=bond['donor_type'],
        acceptor_atom=bond['acceptor_type'],
        distance=bond['distance'],
        angle=bond['angle']
    )
    print(f"Energy: {energy.total:.2f} kcal/mol")
```

### Template: Statistical Validation

```python
from bondforge.statistical_validator import StatisticalValidator

validator = StatisticalValidator()

# Validate interaction
result = validator.calculate_zscore(
    'hydrogen_bond',
    observed_distance=2.9,
    observed_angle=165
)

print(f"Z-score: {result['z_score_distance']:.2f}")
print(f"Typical: {result['is_typical']}")
print(f"Confidence: {result['confidence']}")
```

## 🔧 Customization Examples

### Custom Distance Cutoffs

```python
analyzer = ExtendedProteinInteractionAnalyzer('protein.pdb')

# Custom hydrogen bond cutoff
h_bonds = analyzer.find_hydrogen_bonds(distance_cutoff=3.2)

# Custom salt bridge cutoff
salt_bridges = analyzer.find_salt_bridges(distance_cutoff=3.8)
```

### Custom Configuration File

```yaml
# my_config.yaml
analysis:
  distance_cutoffs:
    hydrogen_bond: 3.2
    salt_bridge: 3.8
  energy_calculation:
    method: advanced
    force_field: amber
```

Then use:
```bash
bondforge analyze protein.pdb --config my_config.yaml
```

## 📊 Example Use Cases

### 1. Drug Discovery
Analyze protein-ligand interactions for drug design

### 2. Protein Engineering
Compare wild-type vs mutant to guide mutations

### 3. Stability Analysis
Identify critical interactions for stability

### 4. Interface Characterization
Study protein-protein binding interfaces

### 5. Quality Control
Validate structure quality and completeness

## 🎓 Learning Path

**Beginners:**
1. Start with `cli_examples.sh` Example 1
2. Try `example_demo.py`
3. Explore basic CLI commands

**Intermediate:**
1. Run `comprehensive_example.py`
2. Try custom configurations
3. Experiment with different interaction types

**Advanced:**
1. Use advanced energy calculations
2. Implement statistical validation
3. Create custom analysis workflows
4. Batch process multiple structures

## 🐛 Troubleshooting

**PDB file not found:**
```bash
# Download test structures
wget https://files.rcsb.org/download/1ABC.pdb
```

**Module not found:**
```bash
# Install BondForge
pip install -e .
```

**CLI command not found:**
```bash
# Reinstall with entry points
pip install -e .
```

## 📞 Need Help?

- 📚 **Documentation**: See `docs/` directory
- 💬 **Discussions**: [GitHub Discussions](https://github.com/AyehBlk/BondForge/discussions)
- 🐛 **Issues**: [GitHub Issues](https://github.com/AyehBlk/BondForge/issues)
- 📧 **Email**: ayehbolouki1988@gmail.com

## 🎉 Contribute Examples

Have a cool use case? Share it!

1. Create your example script
2. Add documentation
3. Submit a pull request

See [CONTRIBUTING.md](../CONTRIBUTING.md) for guidelines.

---

**Happy Forging! 🔥**

*These examples help you get started quickly with BondForge*
