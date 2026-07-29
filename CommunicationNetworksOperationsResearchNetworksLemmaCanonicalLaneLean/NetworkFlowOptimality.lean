import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure NetworkFlowOptimalityPackage where
  graph : DirectedGraph ℕ
  source : ℕ
  sink : ℕ
  capacities : (Edge → ℝ)
  flow : (Edge → ℝ)
  value : ℝ
  isMaxFlow : Prop

structure NetworkFlowOptimalityEvidence (N : NetworkFlowOptimalityPackage) where
  flowConservation : N.flow ∈ Flow N.graph N.source N.sink
  capacityConstraints : ∀ e, N.flow e ≤ N.capacities e
  maxFlowMinCutValue : N.value = N.graph.minCutValue N.source N.sink N.capacities
  optimalityClosed : N.isMaxFlow ↔ (N.value = N.graph.maxFlowValue N.source N.sink N.capacities)

def NetworkFlowOptimalityClosed (N : NetworkFlowOptimalityPackage) : Prop :=
  N.flow ∈ Flow N.graph N.source N.sink ∧
  (∀ e, N.flow e ≤ N.capacities e) ∧
  N.value = N.graph.minCutValue N.source N.sink N.capacities ∧
  (N.isMaxFlow ↔ (N.value = N.graph.maxFlowValue N.source N.sink N.capacities))

theorem network_flow_optimality_closed_from_evidence (N : NetworkFlowOptimalityPackage) (E : NetworkFlowOptimalityEvidence N) : NetworkFlowOptimalityClosed N := by
  exact And.intro E.flowConservation (And.intro E.capacityConstraints (And.intro E.maxFlowMinCutValue E.optimalityClosed))

end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
end HautevilleHouse