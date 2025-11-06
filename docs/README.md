# Documentation

Complete documentation for the Protein Chemical Interaction Analysis Software.

## 📚 Documentation Files

### Algorithm Specifications

#### [INTERACTION_ALGORITHMS_DESIGN.md](INTERACTION_ALGORITHMS_DESIGN.md)
**Core interaction algorithms (7 types)**

Contains detailed specifications for:
- Hydrogen bonds
- Salt bridges (ionic interactions)
- Disulfide bonds
- Hydrophobic interactions
- Pi-pi stacking
- Cation-pi interactions
- Halogen bonds

Each algorithm includes:
- Scientific background
- Detection criteria (distances, angles)
- Pseudocode implementation
- Parameter recommendations
- Example outputs

#### [EXTENDED_INTERACTIONS_ALGORITHMS.md](EXTENDED_INTERACTIONS_ALGORITHMS.md)
**Extended interaction algorithms (13 additional types)**

Contains specifications for:
- Van der Waals interactions
- Anion-pi interactions
- Sulfur-aromatic (S-π)
- CH-pi interactions
- Metal coordination (enhanced)
- Carbonyl-pi interactions
- Amide-aromatic interactions
- Sulfur-oxygen contacts
- Backbone carbonyl-carbonyl
- Aromatic-oxygen interactions
- Arginine-aromatic interactions
- Backbone amide-aromatic
- Backbone carbonyl-charged

### Implementation Guides

#### [README_IMPLEMENTATION.md](README_IMPLEMENTATION.md)
**Complete implementation guide**

Covers:
- How to integrate the analyzer into your software
- API reference
- Code examples
- Best practices
- Performance optimization tips
- Customization options

#### [PROJECT_SUMMARY.md](PROJECT_SUMMARY.md)
**Project overview and capabilities**

Includes:
- Package contents
- Feature summary
- Use cases
- System requirements
- Getting started quickly

### Scientific References

#### [LITERATURE_REFERENCES.md](LITERATURE_REFERENCES.md)
**Comprehensive scientific citations**

Contains 50+ peer-reviewed references organized by:
- Interaction type
- Methodology
- Validation studies
- Applications

Includes:
- Full citations in multiple formats
- DOI links
- Key findings from each paper
- How each reference informed the algorithms

## 📖 Reading Guide

### For Beginners

**Start with:**
1. [PROJECT_SUMMARY.md](PROJECT_SUMMARY.md) - Get an overview
2. [README_IMPLEMENTATION.md](README_IMPLEMENTATION.md) - Learn how to use the tools
3. [INTERACTION_ALGORITHMS_DESIGN.md](INTERACTION_ALGORITHMS_DESIGN.md) - Understand the core algorithms

### For Algorithm Developers

**Read in order:**
1. [INTERACTION_ALGORITHMS_DESIGN.md](INTERACTION_ALGORITHMS_DESIGN.md) - Core algorithms
2. [EXTENDED_INTERACTIONS_ALGORITHMS.md](EXTENDED_INTERACTIONS_ALGORITHMS.md) - Extended algorithms
3. [LITERATURE_REFERENCES.md](LITERATURE_REFERENCES.md) - Scientific basis
4. [README_IMPLEMENTATION.md](README_IMPLEMENTATION.md) - Implementation details

### For Researchers

**Focus on:**
1. [LITERATURE_REFERENCES.md](LITERATURE_REFERENCES.md) - Citations and methodology
2. [INTERACTION_ALGORITHMS_DESIGN.md](INTERACTION_ALGORITHMS_DESIGN.md) - Algorithm details
3. [EXTENDED_INTERACTIONS_ALGORITHMS.md](EXTENDED_INTERACTIONS_ALGORITHMS.md) - All interaction types

### For Software Integrators

**Essential reading:**
1. [README_IMPLEMENTATION.md](README_IMPLEMENTATION.md) - Integration guide
2. [PROJECT_SUMMARY.md](PROJECT_SUMMARY.md) - Features and capabilities
3. API documentation in source files

## 🔬 Scientific Rigor

All algorithms are based on:
- Peer-reviewed literature
- Established biophysical principles
- Statistical analysis of protein structures
- Experimental validation data

See [LITERATURE_REFERENCES.md](LITERATURE_REFERENCES.md) for complete citations.

## 💡 Quick Reference

### Detection Criteria Summary

| Interaction Type | Distance | Angle | Energy |
|-----------------|----------|-------|--------|
| Hydrogen bond | 2.5-3.5 Å | 120-180° | 1-5 kcal/mol |
| Salt bridge | <4.0 Å | N/A | 3-20 kcal/mol |
| Disulfide | 2.0-2.1 Å | N/A | 50-70 kcal/mol |
| Hydrophobic | <5.0 Å | N/A | 0.5-2 kcal/mol |
| Pi-pi stacking | 3.4-5.5 Å | Various | 1-5 kcal/mol |
| Cation-pi | <6.0 Å | Perpendicular | 1-5 kcal/mol |
| Halogen bond | <4.0 Å | 140-180° | 0.5-4 kcal/mol |

See documentation files for complete details on all 20 interaction types.

## 📊 Algorithm Components

### Core Components

1. **Distance Calculations**
   - Euclidean distance between atoms/residues
   - Center of mass calculations for aromatic rings
   - Nearest atom distances

2. **Angle Calculations**
   - Donor-H-Acceptor angles for H-bonds
   - Ring plane orientations for aromatic interactions
   - Approach angles for various interactions

3. **Geometric Validation**
   - Planarity checks for aromatic systems
   - Coordination geometry for metals
   - Orientation requirements

4. **Energy Estimation**
   - Lennard-Jones potentials
   - Electrostatic contributions
   - Empirical energy functions

### Advanced Features

1. **Network Analysis**
   - Graph representation of interactions
   - Hub residue identification
   - Critical path detection

2. **Interface Analysis**
   - Chain-chain interactions
   - Surface area calculations
   - Interface residue identification

3. **Statistical Analysis**
   - Interaction frequency
   - Residue connectivity
   - Spatial distribution

## 🛠️ Customization

All algorithms support customizable parameters:

```python
# Example: Adjust hydrogen bond criteria
h_bonds = analyzer.find_hydrogen_bonds(
    distance_cutoff=3.2,  # Stricter distance
    angle_cutoff=140      # More linear angle
)

# Example: Modify hydrophobic distance
hydrophobic = analyzer.find_hydrophobic_interactions(
    distance_cutoff=4.5   # Shorter range
)
```

See [README_IMPLEMENTATION.md](README_IMPLEMENTATION.md) for all parameters.

## 📝 Citation Format

When citing this software in publications, use:

```bibtex
@software{BondForge: protein_interaction_analyzer,
  title = {BondForge: Protein Chemical Interaction Analysis Software},
  author = {Ayeh Bolouki},
  year = {2025},
  url = {https://github.com/AyehBlk/BondForge}
}
```

For specific algorithms, cite the relevant papers in [LITERATURE_REFERENCES.md](LITERATURE_REFERENCES.md).

## 🤝 Contributing to Documentation

Found an error or want to improve the documentation?

1. Fork the repository
2. Make your changes
3. Submit a pull request

See [CONTRIBUTING.md](../CONTRIBUTING.md) for guidelines.

## 📞 Questions?

- **General questions**: Open a [discussion](https://github.com/AyehBlk/BondForge/discussions)
- **Bug reports**: Open an [issue](https://github.com/AyehBlk/BondForge/issues)
- **Algorithm questions**: See [LITERATURE_REFERENCES.md](LITERATURE_REFERENCES.md)
- **Implementation help**: See [README_IMPLEMENTATION.md](README_IMPLEMENTATION.md)

## 🗂️ Related Resources

### External Documentation
- [BioPython Tutorial](http://biopython.org/DIST/docs/tutorial/Tutorial.html)
- [PDB File Format Guide](https://www.wwpdb.org/documentation/file-format)
- [RCSB PDB](https://www.rcsb.org/)

### Related Tools
- PyMOL - Molecular visualization
- RING - Residue interaction network generator
- LigPlot+ - Protein-ligand interaction diagrams
- PISA - Protein interface analysis

### Scientific Databases
- [Protein Data Bank](https://www.rcsb.org/)
- [UniProt](https://www.uniprot.org/)
- [PDBe](https://www.ebi.ac.uk/pdbe/)

---

**Last updated**: 2025-11-05  
**Version**: 1.0.0
