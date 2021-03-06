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
     * Computes molecular weight by summing the weights of all the atoms that comprise the molecule.
     *
     * @return the molecular weight of the molecule in grams per mole
     */
    public double getMolecularWeight() {
        double a = 0.0;
        for (BondedAtom atom : getAllAtoms()) {
            a += atom.getElement().getWeight();
        }
        return a;
    }

    /**
     * Determines whether this molecule contains any charged atoms.
     * <p>
     * Charged atoms have a different total number of bonds than their valence.
     * For example, an oxygen atom with three bonds is charged.
     * <p>
     * Note that this should be <i>easy</i> to complete once you have found all atoms in the molecule
     * and added them to the allAtoms list.
     *
     * @return true if there is at least one charged atom in the molecule, false otherwise
     */
    public boolean hasChargedAtoms() {
        for (BondedAtom atom : getAllAtoms()) {
            if (atom.getElement().getValence() != atom.getBondCount()) {
                return true;
            }
        }

        return false;
    }

    /**
     * Searches the molecule for a ring.
     * <p>
     * Note that if this returns non-null (indicating that there is a ring), getIupacName will
     * pass the list to {@link #rotateRing(List) rotateRing} and use <i>that</i> function's output
     * as the cyclic backbone.
     * <p>
     * This is cycle detection.
     *
     * @return a list containing the atoms in the ring if a ring exists, null otherwise
     * @see <a href="https://en.wikipedia.org/wiki/Cycle_(graph_theory)">Cycle Detection</a>
     */
    public List<BondedAtom> getRing() {
        ArrayList<BondedAtom> nmb = new ArrayList<>();
        /**for (BondedAtom atom : sb.getOtherAtoms()) {
            nmb.add(sb);
            if (sb atom.getOtherAtoms() && nmb.size() > 1) {

            }
        }*/
        return null;
    }

    /**
     * Helper function to search the molecule for a ring from a specific starting point.
     * <p>
     * This is cycle detection.
     *
     * @param current the current atom we are examining.
     * @param visited a list of previously-visited atom. The previous atom is the last in the list.
     * @return a list containing the atoms in the ring if a ring exists, null otherwise
     * @see <a href="https://en.wikipedia.org/wiki/Cycle_(graph_theory)">Cycle Detection</a>
     */
    public List<BondedAtom> getRing(final BondedAtom current, final List<BondedAtom> visited) {
        return null;
    }

    /**
     * Identify the linear backbone of the molecule.
     * <p>
     * See the chemistry tutorial in the MP writeup for how to determine the best backbone.
     *
     * @return the list of atoms constituting the linear backbone of this atom
     */
    public List<BondedAtom> getLinearBackbone() {
        return null;
    }

    /**
     * Find all atoms that are molecule tips: carbons that are bonded to at most one o