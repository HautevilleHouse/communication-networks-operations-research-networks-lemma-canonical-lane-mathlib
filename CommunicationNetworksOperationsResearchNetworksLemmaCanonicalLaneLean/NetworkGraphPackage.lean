import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure NetworkGraphPackage where
  vertexCount : Nat
  edgeSet : Set (Nat × Nat)
  adjacencyMatrix : Matrix (Fin vertexCount) (Fin vertexCount) Float
  degreeSequence : List Nat
  connectivity : Prop
  connectivityTerm : connectivity

structure NetworkGraphEvidence (G : NetworkGraphPackage) where
  connectivityClosed : G.connectivity
  adjacencySymmetric : G.adjacencyMatrix = G.adjacencyMatrix.transpose
  degreeSequenceMatches : G.degreeSequence = List.map (fun i => (List.sum (List.ofFn (fun j => G.adjacencyMatrix i j))).toNat) (List.finRange G.vertexCount)

def NetworkGraphClosed (G : NetworkGraphPackage) : Prop :=
  G.connectivity ∧ (G.adjacencyMatrix = G.adjacencyMatrix.transpose) ∧ (G.degreeSequence = List.map (fun i => (List.sum (List.ofFn (fun j => G.adjacencyMatrix i j))).toNat) (List.finRange G.vertexCount))

theorem network_graph_closed_from_evidence (G : NetworkGraphPackage) (E : NetworkGraphEvidence G) : NetworkGraphClosed G := by
  exact And.intro E.connectivityClosed (And.intro E.adjacencySymmetric E.degreeSequenceMatches)

end HautevilleHouse
end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
