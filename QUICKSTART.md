# 🔥 BondForge v2.0.0 - Quick Start Guide

Forge your first insights in under 5 minutes with BondForge's professional CLI!

---

## Installation

### Option 1: Standard Installation (Recommended)

```bash
# Clone BondForge
git clone https://github.com/AyehBlk/BondForge.git
cd BondForge

# Create virtual environment (recommended)
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Install BondForge with CLI
pip install -e .

# Verify installation
bondforge --version
bondforge info
```

### Option 2: Direct Installation from GitHub

```bash
pip install git+https://github.com/AyehBlk/BondForge.git
```

### Option 3: Development Installation

```bash
# For contributors and developers
pip install -e ".[dev,docs,viz,all]"
```

---

## First Analysis - Three Ways!

### 🎯 Method 1: CLI (New in v2.0.0!) - **Fastest Way**

```bash
# Download a sample structure
curl -O https://files.rcsb.org/download/1ABC.pdb

# Analyze with one command!
bondforge analyze 1ABC.pdb

# That's it! Check your results in bondforge_results/
```

**Output:**
```
🔥 BondForge Analysis Complete
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Total interactions: 1,588
  ⚡ Hydrogen bonds: 287
  🔌 Salt bridges: 12
  🔗 Disulfide bonds: 4
  💧 Hydrophobic: 856
  📐 Pi-pi stacking: 23
  ... and more!

✅ Results saved to: bondforge_results/
```

### 🐍 Method 2: Python API (Compatible with v1.0.0)

Create `quick_analysis.py`:

```python
from bondforge import ExtendedProteinInteractionAnalyzer

# Load protein
analyzer = ExtendedProteinInteractionAnalyzer('1ABC.pdb')

# Analyze all 20 interaction types
results = analyzer.analyze_all_interactions()

# Print summary
print(f"🔥 Found {results['total_interactions']} total interactions")
print(f"📊 Detected {len(results['by_type'])} interaction types")

# Find hub residues
hubs = analyzer.identify_hub_residues(threshold=5)
print(f"🎯 Found {len(hubs)} hub residues")

# Export
analyzer.export_to_csv('interactions.csv')
print("✅ Results exported!")
```

Run it:
```bash
python quick_analysis.py
```

### ⚡ Method 3: Advanced CLI with Options

```bash
# Analyze specific interaction types
bondforge analyze 1ABC.pdb --types hydrogen_bonds salt_bridges

# With energy calculations and statistics
bondforge analyze 1ABC.pdb --energy --validate

# Custom output location
bondforge analyze 1ABC.pdb --output my_results/

# Multiple output formats
bondforge analyze 1ABC.pdb --format csv json excel

# Full analysis with visualization
bondforge analyze 1ABC.pdb --energy --validate --visualize
```

---

## 🚀 CLI Quick Reference

### Main Commands

```bash
# Analyze single structure
bondforge analyze protein.pdb

# Batch processing multiple structures
bondforge batch *.pdb --output batch_results/

# Compare two structures
bondforge compare wildtype.pdb mutant.pdb

# Validate structure quality
bondforge validate protein.pdb

# Generate visualizations
bondforge visualize protein.pdb --network --heatmap

# Configuration management
bondforge config --show        # View current config
bondforge config --init        # Create default config
bondforge config --edit        # Open in editor

# Package information
bondforge info                 # Package details
bondforge --version            # Version number
bondforge --help               # Full help
```

### Analysis Options

```bash
bondforge analyze protein.pdb \
    --types hydrogen_bonds salt_bridges pi_pi_stacking \  # Specific types
    --output results/ \                                    # Output directory
    --format csv json \                                    # Output formats
    --energy \                                             # Calculate energies
    --validate \                                           # Statistical validation
    --visualize \                                          # Generate plots
    --hub-threshold 10 \                                   # Hub detection threshold
    --parallel \                                           # Use all CPU cores
    --config custom.yaml                                   # Custom configuration
```

---

## 📊 Common Use Cases

### 1. Quick Protein Stability Check

**CLI:**
```bash
bondforge analyze protein.pdb --types salt_bridges disulfide_bonds hydrogen_bonds
```

**Python:**
```python
analyzer = ExtendedProteinInteractionAnalyzer('protein.pdb')

print("Stability Analysis:")
print(f"  Salt bridges: {len(analyzer.find_salt_bridges())}")
print(f"  Disulfide bonds: {len(analyzer.find_disulfide_bonds())}")
print(f"  H-bonds: {len(analyzer.find_hydrogen_bonds())}")
```

### 2. Interface Analysis (Multi-chain Protein)

**CLI:**
```bash
bondforge analyze complex.pdb --chains A,B --interface
```

**Python:**
```python
analyzer = ExtendedProteinInteractionAnalyzer('complex.pdb')
interface = analyzer.analyze_interface('A', 'B')

print(f"Interface interactions: {interface['interaction_count']}")
print(f"Interface area: {interface['interface_area']:.1f} Ų")
print(f"Key residues: {interface['key_residues']}")
```

### 3. Binding Site Characterization

**CLI:**
```bash
bondforge analyze protein_ligand.pdb --ligand LIG --binding-site
```

**Python:**
```python
analyzer = ExtendedProteinInteractionAnalyzer('protein_ligand.pdb')
site = analyzer.analyze_binding_site(ligand_chain='L')

print(f"Binding site residues: {len(site['residues'])}")
print(f"Interaction types: {list(site['interaction_types'].keys())}")
print(f"Binding energy estimate: {site['energy_estimate']:.1f} kcal/mol")
```

### 4. Batch Processing Multiple Structures

**CLI:**
```bash
# Process all PDB files in current directory
bondforge batch *.pdb --output batch_results/ --parallel

# Compare batch results
bondforge batch protein1.pdb protein2.pdb protein3.pdb --compare
```

**Python:**
```python
from pathlib import Path

pdb_files = Path('.').glob('*.pdb')
results = {}

for pdb in pdb_files:
    analyzer = ExtendedProteinInteractionAnalyzer(str(pdb))
    results[pdb.stem] = analyzer.analyze_all_interactions()

# Compare
for name, result in results.items():
    print(f"{name}: {result['total_interactions']} interactions")
```

### 5. Advanced Energy Analysis (New in v2.0.0!)

**Python:**
```python
from bondforge import ExtendedProteinInteractionAnalyzer
from bondforge.energy_calculator import AdvancedEnergyCalculator

analyzer = ExtendedProteinInteractionAnalyzer('protein.pdb')
calc = AdvancedEnergyCalculator()

# Analyze hydrogen bonds with energy decomposition
h_bonds = analyzer.find_hydrogen_bonds()

for bond in h_bonds[:5]:
    energy = calc.calculate_hydrogen_bond_energy(
        donor_atom=bond['donor_type'],
        acceptor_atom=bond['acceptor_type'],
        distance=bond['distance'],
        angle=bond['angle']
    )
    
    print(f"\nH-bond: {bond['donor']} → {bond['acceptor']}")
    print(f"  Total energy: {energy.total:.2f} kcal/mol")
    print(f"    Electrostatic: {energy.electrostatic:.2f}")
    print(f"    Polarization: {energy.polarization:.2f}")
    print(f"    Charge transfer: {energy.charge_transfer:.2f}")
    print(f"    Dispersion: {energy.dispersion:.2f}")
```

### 6. Statistical Validation (New in v2.0.0!)

**Python:**
```python
from bondforge.statistical_validator import StatisticalValidator

validator = StatisticalValidator()

# Check if interaction is statistically typical
z_result = validator.calculate_zscore(
    'hydrogen_bond',
    observed_distance=2.9,
    observed_angle=165
)

print(f"Z-score (distance): {z_result['z_score_distance']:.2f}")
print(f"Percentile: {z_result['percentile_distance']:.1%}")
print(f"Is typical: {z_result['is_typical']}")
print(f"Confidence: {z_result['confidence']}")

# Overall interaction confidence
confidence, scores = validator.calculate_interaction_confidence(
    interaction_type='hydrogen_bond',
    distance=2.9,
    angle=165,
    energy=-3.5
)

print(f"\nOverall confidence: {confidence:.3f}")
print(f"Component scores:")
for component, score in scores.items():
    print(f"  {component}: {score:.3f}")
```

---

## 🎨 Visualization Examples

### Generate Network Graph

**CLI:**
```bash
bondforge visualize protein.pdb --network --output network.png
```

**Python:**
```python
from bondforge import ExtendedProteinInteractionAnalyzer
from bondforge.interaction_visualizer import InteractionVisualizer

analyzer = ExtendedProteinInteractionAnalyzer('protein.pdb')
results = analyzer.analyze_all_interactions()

viz = InteractionVisualizer(analyzer)
viz.plot_interaction_network(results, output='network.png')
```

### Create Heatmap

```python
viz.plot_interaction_heatmap(
    residues=analyzer.get_all_residues(),
    output='heatmap.png'
)
```

### Generate PyMOL Script

```python
viz.generate_pymol_script(
    output='visualize.pml',
    color_by='type',
    show_labels=True
)
```

Then in PyMOL:
```
@visualize.pml
```

---

## ⚙️ Configuration

### Create Custom Configuration

```bash
# Generate default config
bondforge config --init

# This creates ~/.bondforge/config.yaml
```

Edit the config:

```yaml
# bondforge.yaml
analysis:
  distance_cutoffs:
    hydrogen_bond: 3.2  # Stricter than default
    salt_bridge: 3.8
  
  energy_calculation:
    enabled: true
    method: advanced       # Use QM corrections
    force_field: amber

performance:
  n_jobs: 8              # Use 8 cores
  cache_enabled: true

output:
  format: [csv, json]
  precision: 3
  include_metadata: true

visualization:
  dpi: 300
  style: publication
  color_scheme: viridis
```

Use it:
```bash
bondforge analyze protein.pdb --config bondforge.yaml
```

---

## 🐛 Troubleshooting

### Installation Issues

```bash
# Check Python version (need 3.7+)
python --version

# Update pip
pip install --upgrade pip

# Install with verbose output
pip install -v -e .

# Check installation
bondforge info
```

### Import Errors

```python
# If getting import errors, check installation
import bondforge
print(bondforge.__version__)
print(bondforge.__file__)

# Check if modules are available
from bondforge import ExtendedProteinInteractionAnalyzer
from bondforge.energy_calculator import AdvancedEnergyCalculator
from bondforge.statistical_validator import StatisticalValidator
```

### PDB Parsing Errors

```bash
# Validate PDB file first
bondforge validate protein.pdb

# Check structure
python -c "
from Bio.PDB import PDBParser
parser = PDBParser()
structure = parser.get_structure('test', 'protein.pdb')
print(f'Chains: {[c.id for c in structure.get_chains()]}')
print(f'Residues: {len(list(structure.get_residues()))}')
"
```

### No Interactions Found

```bash
# Try with relaxed thresholds
bondforge analyze protein.pdb --distance-cutoff 4.0

# Or check specific types
bondforge analyze protein.pdb --types hydrogen_bonds --verbose
```

---

## 📚 Next Steps

### Learn More

1. **Read full documentation**: `docs/` folder
2. **Explore examples**: `examples/` folder
3. **Try advanced features**: 
   - Energy calculations
   - Statistical validation
   - Batch processing
   - Configuration system

### Advanced Topics

- [CLI Reference](docs/CLI_REFERENCE.md) - All commands and options
- [Configuration Guide](docs/CONFIGURATION.md) - Advanced config
- [Energy Calculations](docs/ENERGY_CALCULATIONS.md) - QM methods
- [Statistical Validation](docs/STATISTICAL_VALIDATION.md) - Statistics
- [Performance Tuning](docs/PERFORMANCE.md) - Optimization tips
- [API Reference](docs/API_REFERENCE.md) - Complete API

---

## 🆘 Getting Help

### Resources

- 📖 **Documentation**: Check `docs/` folder
- 💬 **Discussions**: [GitHub Discussions](https://github.com/AyehBlk/BondForge/discussions)
- 🐛 **Bug Reports**: [GitHub Issues](https://github.com/AyehBlk/BondForge/issues)
- 📧 **Email**: ayehbolouki1988@gmail.com or ayehgeek@gmail.com

### Quick Help Commands

```bash
# General help
bondforge --help

# Command-specific help
bondforge analyze --help
bondforge batch --help
bondforge compare --help

# Show configuration
bondforge config --show

# Package information
bondforge info
```

---

## ✨ What's New in v2.0.0?

- ⚡ **10-20x faster** analysis
- 🎨 **Professional CLI** with beautiful output
- 🔬 **Advanced energy calculations** with QM corrections
- 📊 **Statistical validation** with confidence scores
- ⚙️ **Configuration system** for customization
- 🚀 **Parallel processing** for large datasets
- 📈 **Enhanced visualizations** with better plots
- 💾 **4x less memory** usage
- 🎯 **Hub detection** with network metrics
- 📚 **Comprehensive documentation**

---

## 🎯 Quick Command Cheatsheet

```bash
# Basic
bondforge analyze protein.pdb
bondforge batch *.pdb
bondforge compare file1.pdb file2.pdb

# With options
bondforge analyze protein.pdb --energy --visualize
bondforge analyze protein.pdb --types hydrogen_bonds salt_bridges
bondforge analyze protein.pdb --output results/ --format csv json

# Configuration
bondforge config --init
bondforge config --show
bondforge config --edit

# Information
bondforge --version
bondforge info
bondforge --help
```

---

**Happy Forging! 🔥**

Start analyzing proteins with confidence using BondForge v2.0.0 - where structure meets discovery.

*Made with 🔥 by the structural biology community, for the community*

**Need custom analysis or consulting?**  
Contact: ayehbolouki1988@gmail.com
