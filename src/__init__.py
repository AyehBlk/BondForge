"""
BondForge - Forging Insights from Chemical Bonds

A comprehensive toolkit for analyzing 20 types of chemical interactions
in protein structures.

Modules:
    interaction_analyzer: Core analyzer with 7 interaction types
    extended_interaction_analyzer: Extended analyzer with 20 interaction types
    interaction_visualizer: Visualization and plotting tools
"""

__version__ = '1.0.0'
__author__ = 'Ayeh Bolouki'
__email__ = 'ayehbolouki1988@gmail.com'
__package_name__ = 'BondForge'
__tagline__ = 'Forging Insights from Chemical Bonds'

from .interaction_analyzer import ProteinInteractionAnalyzer
from .extended_interaction_analyzer import ExtendedProteinInteractionAnalyzer
from .interaction_visualizer import InteractionVisualizer

__all__ = [
    'ProteinInteractionAnalyzer',
    'ExtendedProteinInteractionAnalyzer',
    'InteractionVisualizer',
]
