import HautevilleHouse.CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean.NetworkGraphAdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure NetworkFlowOptimization where
  graph : NetworkAdmissibleObject
  source : ℕ
  sink : ℕ
  edgeCapacities : ℝ → ℝ
  maxFlowValue : ℝ
  minCutCapacity : ℝ
  maxFlowMinCutTheorem : Prop

structure NetworkFlowOptimizationEvidence (F : NetworkFlowOptimization) where
  maxFlowMinCutTheoremClosed : F.maxFlowMinCutTheorem

def NetworkFlowOptimizationClosed (F : NetworkFlowOptimization) : Prop :=
  F.maxFlowMinCutTheorem

theorem network_flow_optimization_closed_from_evidence (F : NetworkFlowOptimization)
    (E : NetworkFlowOptimizationEvidence F) : NetworkFlowOptimizationClosed F := by
  exact E.maxFlowMinCutTheoremClosed

end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
end HautevilleHouse