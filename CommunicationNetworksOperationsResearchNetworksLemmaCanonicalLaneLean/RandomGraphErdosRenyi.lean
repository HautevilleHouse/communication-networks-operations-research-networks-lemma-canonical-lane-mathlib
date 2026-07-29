import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure RandomGraphErdosRenyiPackage where
  n : ℕ
  p : ℝ
  graph : Graph ℕ
  degreeDistribution : (ℕ → ℕ)
  connectedComponents : ℕ
  giantComponent : Prop

structure RandomGraphErdosRenyiEvidence (R : RandomGraphErdosRenyiPackage) where
  graphClosed : R.graph = ErdosRenyiRandomGraph R.n R.p
  degreeDistributionClosed : ∀ k, R.degreeDistribution k = R.graph.degreeDistribution k
  connectedComponentsClosed : R.connectedComponents = R.graph.connectedComponents
  giantComponentClosed : R.giantComponent ↔ (R.graph.largestComponentSize > 0.5 * R.n)

def RandomGraphErdosRenyiClosed (R : RandomGraphErdosRenyiPackage) : Prop :=
  R.graph = ErdosRenyiRandomGraph R.n R.p ∧
  (∀ k, R.degreeDistribution k = R.graph.degreeDistribution k) ∧
  R.connectedComponents = R.graph.connectedComponents ∧
  (R.giantComponent ↔ (R.graph.largestComponentSize > 0.5 * R.n))

theorem random_graph_erdos_renyi_closed_from_evidence (R : RandomGraphErdosRenyiPackage) (E : RandomGraphErdosRenyiEvidence R) : RandomGraphErdosRenyiClosed R := by
  exact And.intro E.graphClosed (And.intro E.degreeDistributionClosed (And.intro E.connectedComponentsClosed E.giantComponentClosed))

end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
end HautevilleHouse