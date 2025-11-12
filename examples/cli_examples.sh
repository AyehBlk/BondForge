#!/bin/bash
# BondForge CLI Examples
# Comprehensive examples of using the BondForge command-line interface

echo "======================================================================"
echo "BondForge CLI Examples - Professional Protein Interaction Analysis"
echo "======================================================================"
echo ""

# Check if bondforge is installed
if ! command -v bondforge &> /dev/null; then
    echo "Error: BondForge is not installed or not in PATH"
    echo "Install with: pip install -e ."
    exit 1
fi

echo "✓ BondForge is installed"
echo ""

# ============================================================================
# EXAMPLE 1: Basic Analysis
# ============================================================================
echo "Example 1: Basic Analysis"
echo "-------------------------"
echo "Command: bondforge analyze protein.pdb"
echo ""

# Uncomment to run:
# bondforge analyze protein.pdb

echo "This will analyze all 20 interaction types and save results to bondforge_results/"
echo ""

# ============================================================================
# EXAMPLE 2: Specific Interactions
# ============================================================================
echo "Example 2: Analyze Specific Interactions"
echo "----------------------------------------"
echo "Command: bondforge analyze protein.pdb --types hydrogen_bonds salt_bridges"
echo ""

# Uncomment to run:
# bondforge analyze protein.pdb \
#     --types hydrogen_bonds salt_bridges \
#     --output specific_interactions/

echo "Only analyzes specified interaction types"
echo ""

# ============================================================================
# EXAMPLE 3: Advanced Energy Calculations
# ============================================================================
echo "Example 3: Advanced Energy Calculations"
echo "---------------------------------------"
echo "Command: bondforge analyze protein.pdb --energy --format csv json"
echo ""

# Uncomment to run:
# bondforge analyze protein.pdb \
#     --energy \
#     --format csv json \
#     --output advanced_analysis/

echo "Includes quantum-corrected energy calculations with 5-component decomposition"
echo ""

# ============================================================================
# EXAMPLE 4: Batch Processing
# ============================================================================
echo "Example 4: Batch Processing Multiple Structures"
echo "-----------------------------------------------"
echo "Command: bondforge batch *.pdb --output batch_results/"
echo ""

# Uncomment to run:
# bondforge batch *.pdb \
#     --output batch_results/ \
#     --parallel

echo "Processes all PDB files in parallel"
echo ""

# ============================================================================
# EXAMPLE 5: Structure Comparison
# ============================================================================
echo "Example 5: Compare Two Structures"
echo "---------------------------------"
echo "Command: bondforge compare wildtype.pdb mutant.pdb"
echo ""

# Uncomment to run:
# bondforge compare wildtype.pdb mutant.pdb \
#     --output comparison/

echo "Shows differences in interactions between two structures"
echo ""

# ============================================================================
# EXAMPLE 6: Custom Configuration
# ============================================================================
echo "Example 6: Using Custom Configuration"
echo "-------------------------------------"
echo "Creating custom config file..."

cat > custom_config.yaml << 'EOF'
analysis:
  distance_cutoffs:
    hydrogen_bond: 3.2  # Stricter than default 3.5
    salt_bridge: 3.8
  
  angle_cutoffs:
    hydrogen_bond_min: 130  # More linear than default 120
  
  energy_calculation:
    enabled: true
    method: advanced
    force_field: amber

performance:
  n_jobs: 4  # Use 4 cores
  cache_enabled: true

output:
  format: [csv, json]
  precision: 3
  include_metadata: true
EOF

echo "Config file created: custom_config.yaml"
echo ""
echo "Command: bondforge analyze protein.pdb --config custom_config.yaml"
echo ""

# Uncomment to run:
# bondforge analyze protein.pdb --config custom_config.yaml

echo "Uses custom parameters from config file"
echo ""

# ============================================================================
# EXAMPLE 7: Structure Validation
# ============================================================================
echo "Example 7: Validate Structure Quality"
echo "-------------------------------------"
echo "Command: bondforge validate protein.pdb"
echo ""

# Uncomment to run:
# bondforge validate protein.pdb

echo "Checks structure for completeness and quality issues"
echo ""

# ============================================================================
# EXAMPLE 8: Configuration Management
# ============================================================================
echo "Example 8: Configuration Management"
echo "-----------------------------------"
echo ""

echo "View current configuration:"
echo "Command: bondforge config --show"
echo ""

echo "Initialize user config file:"
echo "Command: bondforge config --init"
echo ""

echo "Edit config file:"
echo "Command: bondforge config --edit"
echo ""

# ============================================================================
# EXAMPLE 9: Advanced Analysis with All Options
# ============================================================================
echo "Example 9: Complete Analysis with All Features"
echo "----------------------------------------------"
echo "Command with all options:"
cat << 'EOF'
bondforge analyze protein.pdb \
    --types hydrogen_bonds salt_bridges hydrophobic pi_pi_stacking \
    --output complete_analysis/ \
    --format csv json xml \
    --hub-threshold 10 \
    --energy \
    --parallel \
    --visualize
EOF
echo ""

echo "This performs comprehensive analysis with:"
echo "  - Specific interaction types"
echo "  - Advanced energy calculations"
echo "  - Hub identification (threshold: 10)"
echo "  - Multiple output formats"
echo "  - Parallel processing"
echo "  - Visualization generation"
echo ""

# ============================================================================
# EXAMPLE 10: Batch with Error Handling
# ============================================================================
echo "Example 10: Batch Processing with Error Handling"
echo "------------------------------------------------"
echo "Command: bondforge batch *.pdb --continue-on-error"
echo ""

# Uncomment to run:
# bondforge batch *.pdb \
#     --output batch_results/ \
#     --parallel \
#     --continue-on-error

echo "Continues processing even if some structures fail"
echo ""

# ============================================================================
# EXAMPLE 11: Getting Help
# ============================================================================
echo "Example 11: Getting Help"
echo "-----------------------"
echo ""

echo "General help:"
echo "  bondforge --help"
echo ""

echo "Command-specific help:"
echo "  bondforge analyze --help"
echo "  bondforge batch --help"
echo "  bondforge compare --help"
echo ""

echo "Version information:"
echo "  bondforge version"
echo ""

# ============================================================================
# SUMMARY
# ============================================================================
echo ""
echo "======================================================================"
echo "Summary"
echo "======================================================================"
echo ""
echo "These examples demonstrate the main features of BondForge CLI:"
echo ""
echo "  1. Basic analysis"
echo "  2. Specific interaction types"
echo "  3. Advanced energy calculations"
echo "  4. Batch processing"
echo "  5. Structure comparison"
echo "  6. Custom configuration"
echo "  7. Structure validation"
echo "  8. Configuration management"
echo "  9. Complete analysis"
echo " 10. Error handling"
echo " 11. Getting help"
echo ""
echo "For more information:"
echo "  • Documentation: docs/"
echo "  • GitHub: https://github.com/AyehBlk/BondForge"
echo "  • Email: ayehbolouki1988@gmail.com"
echo ""
echo "======================================================================"
