import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure RandomGraphPercolationPackage where
  vertexSet : Type u
  edgeProbability : Float
  percolationThreshold : Float
  giantComponentExists : Prop
  clusterDistribution : List Nat
  giantComponentExistsTerm : giantComponentExists

structure RandomGraphPercolationEvidence (R : RandomGraphPercolationPackage) where
  giantComponentExistsClosed : R.giantComponentExists
  probabilityInCriticalWindow : R.edgeProbability ∈ Set.Ioo (R.percolationThreshold - 0.01) (R.percolationThreshold + 0.01) → R.giantComponentExists

def RandomGraphPercolationClosed (R : RandomGraphPercolationPackage) : Prop :=
  R.giantComponentExists ∧ (R.edgeProbability ∈ Set.Ioo (R.percolationThreshold - 0.01) (R.percolationThreshold + 0.01) → R.giantComponentExists)

theorem random_graph_percolation_closed_from_evidence (R : RandomGraphPercolationPackage) (E : RandomGraphPercolationEvidence R) : RandomGraphPercolationClosed R := by
  exact And.intro E.giantComponentExistsClosed E.probabilityInCriticalWindow

end HautevilleHouse
end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
