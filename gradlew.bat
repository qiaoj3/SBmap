package edu.illinois.cs.cs125.spring2019.mp4.lib;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Analyzes a given organic molecule.
 */
public class MoleculeAnalyzer {

    /**
     * List of all atoms in this molecule.
     * <p>
     * You should set this properly in your constructor using findAllAtoms. Once you do it makes several
     * other functions (getMolecularWeight, hasChargedAtoms) easy to complete.
     */
    private ArrayList<BondedAtom> allAtoms = new ArrayList<>();
    /**
     * sb.
     */
    private BondedAtom sb;

    /**
     * Return the list of all atoms in this molecule.
     * <p>
     * This is a convenience method used by the test suite's helper tests.
     *
     * @return a list of all atoms in this molecule.
     */
    public List<BondedAtom> getAllAtoms() {
        findAllAtoms(this.sb, allAtoms);
        return allAtoms;
    }

    /**
     * Creates an MoleculeAnalyzer for analyzing a given molecule.
     *
     * @param molecule an atom belonging to the molecule that will be analyzed.
     */
    MoleculeAnalyzer(final BondedAtom molecule) {
        this.sb = molecule;
    }

    /**
     * Recursively adds connected atoms to the allAtoms list.
     * <p>
     * This is recursive graph traversal.
     *
     * @param current the atom we're currently examining
     * @param atoms list of all atoms we've found so far
     * @return all atoms found in the molecule
     * @see <a href="https://en.wikipedia.org/wiki/Graph_traversal">Graph Traversal</a>
     */
    public ArrayList<BondedAtom> findAllAtoms(final BondedAtom current, final ArrayList<BondedAtom> atoms) {
        if (atoms.contains(current) == false) {
            atoms.add(current);
        }
        for (BondedAtom neighbor : current) {
            if (atoms.contains(neighbor)) {
                continue;
            } else {
                atoms.add(neighbor);
                findAllAtoms(neighbor, atoms);
            }
        }
        return atoms;
    }

    /**
     * Determines the total molecular weight of this molecule.
     * <p>
     * Computes molecular we