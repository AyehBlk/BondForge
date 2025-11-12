# BondForge v2.0.0 - Quick Reference Card

**Professional Protein Interaction Analysis Toolkit**  
*Forging Insights from Chemical Bonds* 🔥

---

## 🚀 Installation

```bash
git clone https://github.com/AyehBlk/BondForge.git
cd BondForge
pip install -e .
bondforge --version  # Verify: 2.0.0
```

---

## 💻 CLI Commands

### Basic Usage
```bash
bondforge analyze protein.pdb              # Analyze structure
bondforge batch *.pdb                      # Batch process
bondforge compare file1.pdb file2.pdb     # Compare structures
bondforge validate protein.pdb             # Validate PDB
bondforge visualize protein.pdb            # Generate plots
bondforge config --show                    # View config
bondforge info                             # Package info
```

### Analysis Options
```bash
bondforge analyze protein.pdb \
    --types hydrogen_bonds salt_bridges \   # Specific types
    --energy \                              # Calculate energies
    --validate \                            # Statistical validation
    --visualize \                           # Generate plots
    --output results/ \                     # Output directory
    --format csv json \                     # Output formats
    --config custom.yaml                    # Custom config
```

---

## 🐍 Python API

### Basic Analysis
```python
from bondforge import ExtendedProteinInteractionAnalyzer

# Initialize
analyzer = ExtendedProteinInteractionAnalyzer('protein.pdb')

# Analyze all 20 interaction types
results = analyzer.analyze_all_interactions()

# Find specific interactions
h_bonds = analyzer.find_hydrogen_bonds()
salt_bridges = analyzer.find_salt_bridges()
pi_stacking = analyzer.find_pi_pi_stacking()

# Export results
analyzer.export_to_csv('interactions.csv')
analyzer.export_to_json('interactions.json')
```

### Advanced Features (NEW in v2.0.0)
```python
# Energy calculations with QM corrections
from bondforge.energy_calculator import AdvancedEnergyCalculator

calc = AdvancedEnergyCalculator()
energy = calc.calculate_hydrogen_bond_energy(
    donor_atom='N',
    acceptor_atom='O',
    distance=2.9,
    angle=165
)
print(f"Total: {energy.total:.2f} kcal/mol")
print(f"  Electrostatic: {energy.electrostatic:.2f}")
print(f"  Polarization: {energy.polarization:.2f}")

# Statistical validation
from bondforge.statistical_validator import StatisticalValidator

validator = StatisticalValidator()
z_result = validator.calculate_zscore(
    'hydrogen_bond',
    observed_distance=2.9,
    observed_angle=165
)
print(f"Z-score: {z_result['z_score_distance']:.2f}")
print(f"Confidence: {z_result['confidence']}")

# Configuration
from bondforge.config import get_config

config = get_config()
cutoff = config.get('analysis.distance_cutoffs.hydrogen_bond')
```

---

## 🎨 Visualization

```python
from bondforge.interaction_visualizer import InteractionVisualizer

viz = InteractionVisualizer(analyzer)

# Network graph
viz.plot_interaction_network(results, output='network.png')

# Heatmap
viz.plot_interaction_heatmap(output='heatmap.png')

# PyMOL script
viz.generate_pymol_script(output='visualize.pml')
```

---

## ⚙️ Configuration

### Create Config File
```bash
bondforge config --init  # Creates ~/.bondforge/config.yaml
```

### Example Config (bondforge.yaml)
```yaml
analysis:
  distance_cutoffs:
    hydrogen_bond: 3.2
    salt_bridge: 3.8
  
  energy_calculation:
    enabled: true
    method: advanced
    force_field: amber

performance:
  n_jobs: 8
  cache_enabled: true

output:
  format: [csv, json]
  precision: 3
```

### Use Config
```bash
bondforge analyze protein.pdb --config bondforge.yaml
```

---

## 🔬 Interaction Types (20 Total)

### Core (7 types)
- `hydrogen_bonds` - H-bond detection
- `salt_bridges` - Ionic interactions
- `disulfide_bonds` - Covalent S-S
- `hydrophobic` - Hydrophobic contacts
- `pi_pi_stacking` - Aromatic stacking
- `cation_pi` - Charged-aromatic
- `halogen_bonds` - X-bond interactions

### Extended (13 types)
- `van_der_waals` - VdW interactions
- `anion_pi` - Anionic-aromatic
- `sulfur_aromatic` - S-π interactions
- `ch_pi` - CH-π interactions
- `metal_coordination` - Metal binding
- `carbonyl_pi` - C=O-π interactions
- `amide_aromatic` - Amide-aromatic
- `sulfur_oxygen` - S···O contacts
- `backbone_carbonyl` - Backbone C=O
- `aromatic_oxygen` - Aromatic-O
- `arginine_aromatic` - Arg-aromatic
- `backbone_amide_aromatic` - Backbone amide
- `backbone_carbonyl_charged` - Backbone charged

---

## 📊 Common Use Cases

### 1. Quick Stability Check
```bash
bondforge analyze protein.pdb \
    --types salt_bridges disulfide_bonds hydrogen_bonds
```

### 2. Interface Analysis
```bash
bondforge analyze complex.pdb --chains A,B --interface
```

### 3. Binding Site
```bash
bondforge analyze protein_ligand.pdb --ligand LIG --binding-site
```

### 4. Batch Processing
```bash
bondforge batch *.pdb --output batch_results/ --parallel
```

### 5. Complete Analysis
```bash
bondforge analyze protein.pdb --energy --validate --visualize
```

---

## 🎯 Hub Residues

```python
# Find hub residues (high connectivity)
hubs = analyzer.identify_hub_residues(threshold=5)

for hub in hubs:
    print(f"{hub['residue']}: {hub['degree']} interactions")
    print(f"  Diversity: {hub['diversity']} types")
    print(f"  Hub score: {hub['hub_score']:.2f}")
```

---

## 📈 Performance

**v2.0.0 Improvements:**
- **10-20x faster** than v1.0.0
- **4x less memory** usage
- Parallel processing support
- Smart caching
- Spatial indexing (KD-trees)

**Benchmarks:**
| Size | v1.0 | v2.0 | Speedup |
|------|------|------|---------|
| 100 res | 10.2s | 0.9s | 11x |
| 300 res | 58.7s | 4.8s | 12x |
| 1000 res | 612s | 31s | 20x |

---

## 🧪 Testing

```bash
# Run all tests
pytest tests/

# With coverage
pytest tests/ --cov=src/bondforge

# Specific test
pytest tests/unit/test_energy_calculator.py

# Fast tests only
pytest tests/ -m "not slow"
```

---

## 📚 File Structure

```
BondForge/
├── src/bondforge/
│   ├── interaction_analyzer.py          # Core (7 types)
│   ├── extended_interaction_analyzer.py # All 20 types
│   ├── interaction_visualizer.py        # Visualization
│   ├── cli.py                          # CLI interface ⭐
│   ├── config.py                       # Configuration ⭐
│   ├── energy_calculator.py            # Energy calc ⭐
│   └── statistical_validator.py        # Validation ⭐
├── docs/              # Documentation
├── examples/          # Usage examples
├── tests/            # Test suite
└── requirements.txt  # Dependencies
```

---

## 🆘 Help & Support

```bash
# Command help
bondforge --help
bondforge analyze --help

# Package info
bondforge info
bondforge --version

# Online resources
# GitHub: https://github.com/AyehBlk/BondForge
# Email: ayehbolouki1988@gmail.com
```

---

## 🐛 Troubleshooting

### Installation Issues
```bash
python --version  # Need 3.7+
pip install --upgrade pip
pip install -e .
```

### Import Errors
```python
import bondforge
print(bondforge.__version__)  # Should be 2.0.0
```

### PDB Errors
```bash
bondforge validate protein.pdb  # Check structure
```

### No Interactions Found
```bash
# Try relaxed thresholds
bondforge analyze protein.pdb --distance-cutoff 4.0
```

---

## ⭐ Key Features v2.0.0

✅ Professional CLI interface  
✅ Advanced energy calculations  
✅ Statistical validation  
✅ Configuration system  
✅ 10-20x faster analysis  
✅ 4x less memory  
✅ Parallel processing  
✅ Enhanced visualizations  
✅ Hub detection  
✅ Complete backward compatibility  

---

## 📖 Quick Links

- **Quickstart**: `QUICKSTART.md`
- **Full Docs**: `docs/` directory
- **Examples**: `examples/` directory
- **Contributing**: `CONTRIBUTING.md`
- **Changelog**: `CHANGELOG.md`
- **Tests**: `tests/README.md`

---

## 💡 Pro Tips

1. **Use CLI for quick analysis** - Fastest way to get results
2. **Configure once** - Set defaults with `bondforge config --init`
3. **Batch process** - Analyze multiple structures at once
4. **Enable caching** - Speed up repeated analyses
5. **Use validation** - Get confidence scores for interactions
6. **Check hubs** - Find key structural residues
7. **Visualize** - Generate publication-quality figures

---

## 🔥 Example Workflow

```bash
# 1. Quick check
bondforge analyze protein.pdb

# 2. Detailed analysis with energy
bondforge analyze protein.pdb --energy --output results/

# 3. Batch process similar structures
bondforge batch protein_*.pdb --output batch/

# 4. Compare variants
bondforge compare wildtype.pdb mutant.pdb

# 5. Visualize results
bondforge visualize protein.pdb --network --heatmap
```

---

**BondForge v2.0.0** - *Forging Insights from Chemical Bonds* 🔥

*Made with ❤️ for the structural biology community*

**Author**: Ayeh Bolouki  
**Email**: ayehbolouki1988@gmail.com | ayehgeek@gmail.com  
**GitHub**: https://github.com/AyehBlk/BondForge  
**License**: MIT

---

*Print this card and keep it handy!*
