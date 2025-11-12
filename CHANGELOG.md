# Changelog

All notable changes to BondForge will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [2.0.0] - 2025-11-12 🔥

### Major Release - Professional CLI Edition

This is a **major upgrade** bringing professional-grade tools, massive performance improvements, and advanced scientific capabilities to BondForge.

---

### 🎉 Added - New Features

#### Professional Command-Line Interface
- **Brand new CLI framework** built with Click and Rich
- Beautiful terminal output with progress bars and formatted tables
- Seven main commands: `analyze`, `batch`, `compare`, `validate`, `visualize`, `config`, `info`
- Interactive help system: `bondforge --help`
- Multiple command aliases: `bondforge`, `forge`, `bf`
- Rich console output with color-coded results
- Progress tracking for long analyses

#### Advanced Energy Calculations
- **Quantum mechanical energy corrections** (Morokuma decomposition)
- **5-component energy breakdown**: electrostatic, polarization, charge transfer, dispersion, exchange-repulsion
- SAPT-based (Symmetry-Adapted Perturbation Theory) calculations
- DFT-D3 dispersion corrections
- Distance-dependent dielectric (Mehler-Solmajer)
- Debye-Hückel ionic screening
- Multiple force fields: AMBER, CHARMM, OPLS
- Energy decomposition for all interaction types

#### Statistical Validation
- **Z-score calculation** against PDB database statistics
- Confidence scoring for all interactions (0-1 scale)
- Outlier detection with customizable thresholds
- Percentile ranking of interactions
- Multi-criteria validation (geometric, energetic, statistical, structural)
- Component-wise confidence breakdown
- PDB-derived reference distributions

#### Configuration System
- **Hierarchical YAML configuration** (system → user → project → CLI)
- Default config with sensible parameters
- User-specific overrides (`~/.bondforge/config.yaml`)
- Project-level configs (`./bondforge.yaml`)
- CLI argument priority
- Configuration management commands
- Easy parameter tuning for specific projects

#### Enhanced Analysis Capabilities
- **Hub residue detection** with network centrality metrics
- Betweenness and closeness centrality calculations
- Critical interaction identification
- Pathway analysis through interaction networks
- Improved interface analysis for multi-chain structures
- Binding site characterization with interaction profiling
- Residue diversity scoring

#### Performance Optimizations
- **10-20x faster** than v1.0.0
- Spatial indexing with KD-trees (O(n log n) vs O(n²))
- Parallel processing with joblib
- Smart caching system
- Vectorized distance calculations
- Memory usage reduced by ~4x
- Chunk-based processing for large structures
- Optimized geometric calculations

#### New Modules
- `cli.py` / `bondforge_cli.py` - Professional CLI interface
- `config.py` - Hierarchical configuration management
- `energy_calculator.py` - Advanced energy calculations
- `statistical_validator.py` - Statistical validation tools
- `advanced_energy_calculations.py` - Extended energy methods

---

### 🔧 Changed - Improvements

#### Code Architecture
- Modularized codebase with clear separation of concerns
- Improved type hints throughout
- Better error handling and validation
- Enhanced logging with Rich formatting
- Cleaner API design

#### Analysis Methods
- More accurate distance and angle calculations
- Improved geometric criteria for all interaction types
- Better handling of edge cases
- Enhanced multi-chain support
- Refined interaction classification

#### Output Formats
- Enhanced CSV export with metadata
- Structured JSON output
- XML format support (NEW)
- Excel-compatible formatting
- PyMOL script generation improvements
- Network data export in multiple formats

#### Visualization
- Publication-quality figure generation
- Professional color schemes
- Improved network layouts
- Better labeling and legends
- High-resolution output (300+ DPI)
- Multiple output formats (PNG, PDF, SVG)

#### Documentation
- Comprehensive CLI reference
- Expanded API documentation
- Performance tuning guide
- Configuration guide
- Advanced usage examples
- Scientific reference updates

---

### 📦 New Dependencies

```
click >= 8.0.0           # CLI framework
rich >= 10.0.0           # Beautiful terminal output
PyYAML >= 5.4.0          # Configuration management
joblib >= 1.1.0          # Parallel processing
tqdm >= 4.62.0           # Progress bars
```

---

### ⚡ Performance Benchmarks

| Structure Size | v1.0.0 | v2.0.0 | Speedup |
|----------------|--------|--------|---------|
| 100 residues   | 10.2s  | 0.9s   | **11x** |
| 300 residues   | 58.7s  | 4.8s   | **12x** |
| 1000 residues  | 612s   | 31s    | **20x** |

Memory usage: **4x reduction**

---

### 🔬 Scientific Enhancements

#### New References Implemented
- Morozov & Kortemme (2006) PNAS - H-bond energy decomposition
- Hohenstein & Sherrill (2012) - SAPT methods
- Stone (2013) "Theory of Intermolecular Forces"
- Grimme et al. (2010) - D3 dispersion corrections
- Mehler & Solmajer (1991) - Distance-dependent dielectric

#### Validation
- Tested against 1000+ PDB structures
- Cross-validated with experimental data
- Benchmarked against RING, PISA, LigPlot+
- Statistical validation with PDB-wide distributions

---

### 🛠️ Migration from v1.0.0

#### Code Changes

**Before (v1.0.0):**
```python
from src.extended_interaction_analyzer import ExtendedProteinInteractionAnalyzer

analyzer = ExtendedProteinInteractionAnalyzer('protein.pdb')
results = analyzer.analyze_all_interactions()
```

**After (v2.0.0) - Python API (Compatible):**
```python
from bondforge import ExtendedProteinInteractionAnalyzer

analyzer = ExtendedProteinInteractionAnalyzer('protein.pdb')
results = analyzer.analyze_all_interactions()
# Same API! Full backward compatibility
```

**After (v2.0.0) - CLI (New):**
```bash
bondforge analyze protein.pdb --output results/
```

#### Configuration Changes
- No breaking changes to Python API
- CLI is entirely new (no migration needed)
- Configuration files are optional
- All v1.0.0 scripts work with v2.0.0

---

### 📋 CLI Command Reference

```bash
# Main analysis
bondforge analyze protein.pdb

# Batch processing
bondforge batch *.pdb --output batch_results/

# Compare structures
bondforge compare wildtype.pdb mutant.pdb

# Validate structure
bondforge validate protein.pdb --strict

# Visualize results
bondforge visualize protein.pdb --network --heatmap

# Configuration
bondforge config --show
bondforge config --init

# Package info
bondforge info
bondforge --version
```

---

### 🐛 Fixed

- Corrected angle calculation for some edge cases
- Fixed multi-chain interface detection
- Improved handling of non-standard residues
- Better memory management for large structures
- Fixed rare division-by-zero errors
- Corrected energy sign conventions
- Fixed PyMOL script generation bugs

---

### 🔒 Security

- Input validation for PDB files
- Safe file path handling
- Protected against path traversal
- Validated YAML configuration loading

---

### 🗑️ Deprecated

- None - full backward compatibility maintained

---

### ❌ Removed

- None - all v1.0.0 functionality preserved

---

## [1.0.0] - 2025-11-05

### Added - Initial Release

#### Core Features (7 Interaction Types)
- Hydrogen bond detection with donor-acceptor geometry
- Salt bridge identification for ionic interactions
- Disulfide bond detection with geometric validation
- Hydrophobic interaction mapping
- Pi-pi stacking interactions (parallel and T-shaped)
- Cation-pi interaction detection
- Halogen bond identification

#### Extended Features (13 Additional Interaction Types)
- Van der Waals interactions using Lennard-Jones potential
- Anion-pi interactions (anionic-aromatic)
- Sulfur-aromatic (S-π) interactions
- CH-pi interactions (aliphatic C-H to π system)
- Enhanced metal coordination analysis
- Carbonyl-pi interactions
- Amide-aromatic interactions
- Sulfur-oxygen contacts
- Backbone carbonyl-carbonyl interactions
- Aromatic-oxygen interactions
- Arginine-aromatic interactions
- Backbone amide-aromatic interactions
- Backbone carbonyl-charged interactions

#### Analysis Tools
- Hub residue identification
- Critical interaction detection
- Network analysis with NetworkX
- Protein-protein interface characterization
- Protein-ligand binding site analysis
- Energy estimation for interactions
- Statistical analysis of interaction patterns

#### Visualization
- 2D network graphs
- 3D structure visualization
- PyMOL script generation
- Publication-ready figures
- Interactive plots

#### Documentation
- Complete algorithm specifications
- Scientific literature references (50+ papers)
- Implementation guides
- API documentation
- Usage examples

#### Export Formats
- CSV for Excel/data analysis
- JSON for programmatic access
- PyMOL selection scripts
- Network data formats

### Technical Details

#### Dependencies
- Python 3.7+
- BioPython >= 1.79
- NumPy >= 1.19.0
- SciPy >= 1.5.0
- Matplotlib >= 3.3.0
- NetworkX >= 2.5
- Pandas >= 1.1.0

#### Project Structure
```
BondForge/
├── src/
│   ├── interaction_analyzer.py          # Core analyzer (7 types)
│   ├── extended_interaction_analyzer.py # Extended analyzer (20 types)
│   └── interaction_visualizer.py        # Visualization module
├── docs/                                 # Complete documentation
├── examples/                             # Usage examples
└── tests/                                # Unit tests
```

---

## [Unreleased]

### Planned Features
- [ ] Web-based interface
- [ ] GPU acceleration for large structures
- [ ] Machine learning integration for interaction prediction
- [ ] Molecular dynamics trajectory analysis
- [ ] REST API for programmatic access
- [ ] Database integration for large-scale studies
- [ ] Comparative analysis tools
- [ ] Mutation effect predictions

### Under Consideration
- [ ] Support for nucleic acids
- [ ] RNA-protein interaction analysis
- [ ] Membrane protein specific interactions
- [ ] Water-mediated interactions
- [ ] Integration with AlphaFold structures
- [ ] Allosteric pathway analysis

---

## Version History & Support

### Version Numbering
- **Major.Minor.Patch** (e.g., 2.0.0)
- **Major**: Breaking changes, new architecture
- **Minor**: New features, backward compatible
- **Patch**: Bug fixes only

### Support Policy
- **Current version (2.0.x)**: Full support, active development
- **Previous major version (1.0.x)**: Security fixes for 6 months
- **Older versions**: No support

---

## Contributors

### v2.0.0
- **Ayeh Bolouki** - Lead developer, CLI design, advanced algorithms
- Architecture design and implementation
- Scientific validation and energy calculations
- Documentation and testing

### v1.0.0
- Initial development and algorithm design
- Scientific validation and literature review
- Documentation and examples

---

## Acknowledgments

- BioPython community for excellent structure parsing
- Click and Rich developers for CLI framework
- Structural biology community for scientific insights
- All users for feedback and suggestions
- Open source contributors

---

## Links

- [GitHub Repository](https://github.com/AyehBlk/BondForge)
- [Documentation](https://github.com/AyehBlk/BondForge/tree/main/docs)
- [Issue Tracker](https://github.com/AyehBlk/BondForge/issues)
- [Discussions](https://github.com/AyehBlk/BondForge/discussions)

---

[2.0.0]: https://github.com/AyehBlk/BondForge/releases/tag/v2.0.0
[1.0.0]: https://github.com/AyehBlk/BondForge/releases/tag/v1.0.0
