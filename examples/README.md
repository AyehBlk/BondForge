# Examples

This directory contains example scripts demonstrating how to use the BondForge.

## Available Examples

### 1. example_demo.py
Basic demonstration of core analyzer functionality (7 interaction types).

**What it shows:**
- Loading PDB structures
- Finding different interaction types
- Exporting results
- Basic analysis workflow

**Usage:**
```bash
python example_demo.py path/to/protein.pdb
```

### 2. comprehensive_example.py
Complete demonstration using both core and extended analyzers (20 interaction types).

**What it shows:**
- Using the core analyzer (7 types)
- Using the extended analyzer (20 types)
- Interface analysis for multi-chain structures
- Visualization generation
- Hub residue identification
- Critical interaction detection
- Export in multiple formats

**Usage:**
```bash
python comprehensive_example.py path/to/protein.pdb
```

**Output files:**
- `core_interactions.csv` - Results from 7 interaction types
- `extended_interactions.csv` - Results from 20 interaction types
- `interaction_network.png` - Network visualization
- `visualize_interactions.pml` - PyMOL script

## Getting Started

### 1. Get a Test Structure

Download a sample PDB file:
```bash
# Small protein for quick testing
wget https://files.rcsb.org/download/1ABC.pdb

# Or a larger complex structure
wget https://files.rcsb.org/download/1A2K.pdb
```

### 2. Run an Example

```bash
# Basic example
python example_demo.py 1ABC.pdb

# Comprehensive example
python comprehensive_example.py 1ABC.pdb
```

## Creating Your Own Scripts

### Template: Basic Analysis

```python
from src.extended_interaction_analyzer import ExtendedProteinInteractionAnalyzer

# Initialize
analyzer = ExtendedProteinInteractionAnalyzer('your_protein.pdb')

# Analyze
results = analyzer.analyze_all_interactions()

# Process results
print(f"Found {results['total_interactions']} interactions")

# Export
analyzer.export_to_csv('results.csv')
```

### Template: Specific Interaction Analysis

```python
from src.interaction_analyzer import ProteinInteractionAnalyzer

analyzer = ProteinInteractionAnalyzer('protein.pdb')

# Focus on specific interactions
h_bonds = analyzer.find_hydrogen_bonds()
salt_bridges = analyzer.find_salt_bridges()

# Analyze results
print(f"H-bonds: {len(h_bonds)}")
print(f"Salt bridges: {len(salt_bridges)}")
```

### Template: Interface Analysis

```python
from src.extended_interaction_analyzer import ExtendedProteinInteractionAnalyzer

analyzer = ExtendedProteinInteractionAnalyzer('complex.pdb')

# Analyze protein-protein interface
interface = analyzer.analyze_interface(
    chain_A='A',
    chain_B='B'
)

print(f"Interface interactions: {interface['interaction_count']}")
print(f"Interface residues: {len(interface['residues_A'])}")
```

## Example Structures to Try

### Good Test Structures from PDB

1. **1ABC** - Small protein, quick analysis
2. **1A2K** - Protein-protein complex, good for interface analysis
3. **1AKE** - Medium size, diverse interactions
4. **1BRS** - Contains disulfide bonds
5. **1HHO** - Hemoglobin, multi-chain with metal coordination

### Download Command

```bash
# Download multiple structures
for pdb in 1ABC 1A2K 1AKE 1BRS 1HHO; do
    wget https://files.rcsb.org/download/${pdb}.pdb
done
```

## Tips for Your Own Analysis

1. **Start Simple**: Begin with the core analyzer and single interaction types
2. **Check Structure**: Verify your PDB loads correctly before analysis
3. **Adjust Thresholds**: Tune distance/angle cutoffs for your specific needs
4. **Validate Results**: Cross-check with PyMOL visualization
5. **Export Data**: Use CSV output for further analysis in Excel or R

## Common Patterns

### Pattern 1: Batch Analysis

```python
import glob
from src.extended_interaction_analyzer import ExtendedProteinInteractionAnalyzer

# Analyze all PDB files in directory
for pdb_file in glob.glob('structures/*.pdb'):
    analyzer = ExtendedProteinInteractionAnalyzer(pdb_file)
    results = analyzer.analyze_all_interactions()
    
    # Save with same name
    output = pdb_file.replace('.pdb', '_interactions.csv')
    analyzer.export_to_csv(output)
    print(f"Processed {pdb_file}")
```

### Pattern 2: Comparison Analysis

```python
# Compare two structures
from src.extended_interaction_analyzer import ExtendedProteinInteractionAnalyzer

wt_analyzer = ExtendedProteinInteractionAnalyzer('wildtype.pdb')
mut_analyzer = ExtendedProteinInteractionAnalyzer('mutant.pdb')

wt_results = wt_analyzer.analyze_all_interactions()
mut_results = mut_analyzer.analyze_all_interactions()

print(f"WT interactions: {wt_results['total_interactions']}")
print(f"Mutant interactions: {mut_results['total_interactions']}")
print(f"Difference: {mut_results['total_interactions'] - wt_results['total_interactions']}")
```

### Pattern 3: Custom Filtering

```python
# Find only strong interactions
analyzer = ExtendedProteinInteractionAnalyzer('protein.pdb')

# Get all salt bridges (typically strong)
salt_bridges = analyzer.find_salt_bridges()

# Get hydrogen bonds with strict criteria
h_bonds = analyzer.find_hydrogen_bonds(
    distance_cutoff=3.2,  # Stricter than default 3.5
    angle_cutoff=140      # More linear than default 120
)

print(f"Strong interactions: {len(salt_bridges) + len(h_bonds)}")
```

## Need Help?

- Check the main [README](../README.md)
- Read the [documentation](../docs/)
- See the [QUICKSTART guide](../QUICKSTART.md)
- Open an [issue](https://github.com/AyehBlk/BondForge/issues)

Happy coding! 🧬
