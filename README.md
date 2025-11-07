# 🔥 BondForge
### *Forging Insights from Chemical Bonds*

[![DOI](https://zenodo.org/badge/1090314769.svg)](https://doi.org/10.5281/zenodo.17534531)
[![Python 3.7+](https://img.shields.io/badge/python-3.7+-blue.svg)](https://www.python.org/downloads/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![BioPython](https://img.shields.io/badge/BioPython-Required-green.svg)](https://biopython.org/)
[![Status](https://img.shields.io/badge/status-production-success.svg)](https://github.com/AyehBlk/BondForge)

---

##  What is BondForge?

**BondForge** is a comprehensive, production-ready toolkit for analyzing **20 types of chemical interactions** in protein structures. Forge your understanding of molecular interactions through powerful analysis, visualization, and insight generation.

Born from the intersection of structural biology and computational analysis, BondForge empowers researchers to discover, analyze, and visualize the intricate network of bonds that define protein structure and function.

###  Core Capabilities

####  Complete Interaction Detection (20 Types)

**Fundamental Interactions:**
-  Hydrogen bonds - The foundation of protein structure
-  Salt bridges - Electrostatic interactions
-  Disulfide bonds - Covalent cross-links
-  Hydrophobic interactions - Core stabilization
-  Pi-pi stacking - Aromatic interactions
-  Cation-pi - Charged-aromatic binding
-  Halogen bonds - X-bond interactions

**Advanced Detection:**
-  Van der Waals - Fundamental forces
-  Anion-pi - Anionic-aromatic
-  Sulfur-aromatic (S-π) - Sulfur chemistry
-  CH-pi - Aliphatic-aromatic
-  Metal coordination - Metal binding
-  Carbonyl-pi - Oxygen-aromatic
-  Amide-aromatic - Peptide interactions
-  Sulfur-oxygen - S···O contacts
-  Backbone interactions - Protein backbone chemistry
- *...and more*

####  Powerful Analysis Tools

- **Hub Residue Identification** - Find critical structural nodes
- **Network Analysis** - Graph-based structure insights
- **Interface Characterization** - Protein-protein interactions
- **Binding Site Mapping** - Ligand binding analysis
- **Energy Estimation** - Quantitative interaction strengths
- **Critical Path Detection** - Essential interaction pathways

####  Visualization & Export

-  Network graphs - Interaction topology
-  3D visualization - Structure overlay
-  PyMOL scripts - Professional rendering
-  Publication figures - Camera-ready output
-  Multiple formats - CSV, JSON, XML
-  Custom exports - Tailored output

---

##  Quick Start

### Installation

```bash
# Clone BondForge
git clone https://github.com/AyehBlk/BondForge.git
cd BondForge

# Install dependencies
pip install -r requirements.txt

# Install BondForge
pip install -e .
```

### Forge Your First Analysis

```python
from bondforge import ExtendedProteinInteractionAnalyzer

# Initialize the forge
forge = ExtendedProteinInteractionAnalyzer('your_protein.pdb')

# Forge complete analysis - all 20 interaction types
results = forge.analyze_all_interactions()

# View what was forged
print(f" Forged {results['total_interactions']} interactions")
print(f" Detected {len(results['by_type'])} interaction types")

# Identify the strongest structural nodes
hubs = forge.identify_hub_residues(threshold=5)
print(f" Found {len(hubs)} hub residues")

# Export your forged insights
forge.export_to_csv('forged_interactions.csv')
print(" Results forged and ready!")
```

---

##  Why BondForge?

### 🔥 Power
- **20 Interaction Types** - Most comprehensive toolkit available
- **Network Analysis** - Graph-based structural insights
- **Energy Calculations** - Quantitative measurements
- **Batch Processing** - Analyze multiple structures

###  Precision
- **Scientifically Validated** - Based on 50+ peer-reviewed papers
- **Geometric Accuracy** - Precise distance and angle criteria
- **Customizable Thresholds** - Fine-tune to your needs
- **Reproducible Results** - Consistent, reliable analysis

###  Clarity
- **Beautiful Visualizations** - Publication-ready figures
- **Clear Documentation** - Comprehensive guides
- **Intuitive API** - Easy to learn and use
- **Rich Examples** - Learn by doing

###  Community
- **Open Source** - MIT licensed
- **Well Maintained** - Active development
- **Extensible** - Add your own analysis
- **Supported** - Responsive community

---

##  What's in the Forge

```
BondForge/
├──  README.md                       ← You are here
├──  LICENSE                         ← MIT License
├──  requirements.txt                ← Dependencies
├──  setup.py                        ← Installation
│
├──  src/                            ← The forge itself
│   ├── interaction_analyzer.py        ← Core forge (7 types)
│   ├── extended_interaction_analyzer.py ← Master forge (20 types)
│   └── interaction_visualizer.py      ← Visualization forge
│
├──  docs/                           ← Knowledge base
│   ├── ALGORITHMS.md                  ← Forging methods
│   ├── REFERENCES.md                  ← Scientific foundation
│   └── API.md                         ← Complete API
│
├──  examples/                       ← Forging examples
│   ├── basic_forge.py                 ← Simple analysis
│   └── master_forge.py                ← Advanced techniques
│
└──  tests/                          ← Quality assurance
```

---

##  Forging Scenarios

### Analyze Protein Stability
```python
from bondforge import ExtendedProteinInteractionAnalyzer

# Initialize forge
forge = ExtendedProteinInteractionAnalyzer('protein.pdb')

# Forge stability analysis
salt_bridges = forge.find_salt_bridges()
disulfide = forge.find_disulfide_bonds()
h_bonds = forge.find_hydrogen_bonds()

print(f" Salt bridges: {len(salt_bridges)}")
print(f" Disulfide bonds: {len(disulfide)}")
print(f" H-bonds: {len(h_bonds)}")
```

### Characterize Protein Interface
```python
# Forge interface analysis
interface = forge.analyze_interface(chain_A='A', chain_B='B')

print(f" Interface interactions: {interface['interaction_count']}")
print(f" Key residues: {len(interface['residues_A'])}")
```

### Map Binding Site
```python
# Forge binding site insights
binding = forge.analyze_binding_site(ligand_chain='L')

print(f" Binding residues: {len(binding['residues'])}")
print(f" Interaction types: {binding['interaction_types']}")
```

---

##  Scientific Foundation

BondForge is built on solid scientific ground:

-  **50+ Peer-Reviewed Papers** - Comprehensive literature base
-  **Crystallographic Validation** - Based on PDB analysis
-  **Quantum Mechanics** - Energy calculations grounded in QM
-  **Experimental Data** - Validated against lab measurements

See [docs/REFERENCES.md](docs/LITERATURE_REFERENCES.md) for complete citations.

---

##  System Requirements

**Minimum:**
- Python 3.7+
- 4 GB RAM
- BioPython 1.79+

**Recommended:**
- Python 3.10+
- 8 GB RAM
- NumPy with MKL optimization

**Dependencies:**
```
biopython >= 1.79
numpy >= 1.19.0
scipy >= 1.5.0
matplotlib >= 3.3.0
networkx >= 2.5
pandas >= 1.1.0
```

---

## 📊 Example Output

```
╔═══════════════════════════════════════════════════════════╗
║   BondForge Analysis Complete                          ║
╚═══════════════════════════════════════════════════════════╝

Structure: 1ABC.pdb (Chain A, 250 residues)

 Forged Interactions:
   Salt bridges:              12
   Hydrogen bonds:            87
   Disulfide bonds:           3
   Hydrophobic:               156
   Pi-pi stacking:            8
   Cation-pi:                 6
   Halogen bonds:             2
   Van der Waals:             1,234
   Anion-pi:                  4
  [... 11 more types]

Total: 1,588 interactions forged 

⚒️ Hub Residues (>10 interactions):
  • ARG45:  15 interactions 
  • TRP102: 14 interactions 
  • TYR158: 12 interactions 

 Critical Interactions:
  • ASP87-ARG45 (salt bridge): Structural pillar
  • CYS22-CYS89 (disulfide): Integrity anchor
  
 Analysis forged successfully!
```

---

##  Documentation

-  **[Quick Start](QUICKSTART.md)** - Forge your first analysis in 5 minutes
-  **[Algorithm Guide](docs/INTERACTION_ALGORITHMS_DESIGN.md)** - How the forge works
-  **[Examples](examples/README.md)** - Learn by forging
-  **[API Reference](docs/README_IMPLEMENTATION.md)** - Complete technical docs
-  **[References](docs/LITERATURE_REFERENCES.md)** - Scientific foundation

---

##  Contributing to the Forge

We welcome contributions! Help us forge better tools:

-  Report bugs
-  Suggest features
-  Improve docs
-  Add new interaction types
-  Write tests

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

##  Citation

If BondForge helped forge insights in your research, please cite:

```bibtex
@software{bondforge2025,
  author       = {Ayeh Bolouki},
  title        = {BondForge: Forging Insights from Chemical Bonds},
  year         = 2025,
  publisher    = {Zenodo},
  version      = {1.0.0},
  doi          = {10.5281/zenodo.17534531},
  url          = {https://doi.org/10.5281/zenodo.17534531}
}
```

**DOI:** [10.5281/zenodo.17534531](https://doi.org/10.5281/zenodo.17534531)

---

## 📄 License

BondForge is forged with ❤️ and released under the MIT License.  
See [LICENSE](LICENSE) for details.

---

##  Acknowledgments

- Built with [BioPython](https://biopython.org/)
- Inspired by master forgers: RING, PISA, LigPlot+
- Thanks to the structural biology community
- Forged with passion for open science

---

##  Get in Touch

-  **Discussions**: [GitHub Discussions](https://github.com/AyehBlk/BondForge/discussions)
-  **Issues**: [GitHub Issues](https://github.com/AyehBlk/BondForge/issues)
-  **Email**: ayehbolouki1988@gmail.com
-  **LinkedIn**: [Ayeh Bolouki](https://www.linkedin.com/in/ayehbolouki/)

---

<div align="center">

## 🔥 **BondForge** 🔥

*Forging Insights from Chemical Bonds*

**Where Structure Meets Discovery**

[![GitHub stars](https://github/stars/AyehBlk/BondForge)](https://github.com/AyehBlk/)

---

###  Professional Services

**Need help with your protein analysis?**

I offer:
-  Custom analysis and consulting
-  Training and workshops  
-  Feature development
-  Research collaboration

**Contact:** ayehbolouki1988@gmail.com

---

**Made with 🔥 by the structural biology community, for the community**

*Engineering Understanding, One Bond at a Time*

[Get Started](QUICKSTART.md) • [Documentation](docs/) • [Examples](examples/) • [Contribute](CONTRIBUTING.md)

</div>
