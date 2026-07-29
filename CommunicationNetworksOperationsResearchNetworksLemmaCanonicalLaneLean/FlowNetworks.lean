import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure FlowNetworkPackage where
  sourceNode : Type
  sinkNode : Type
  capacityFunction : Type
  maxFlowValue : Float
  minCutCapacity : Float
  maxFlowMinCutTheorem : Prop

structure FlowNetworkEvidence (F : FlowNetworkPackage) where
  sourceNonempty : F.sourceNode ≠ Empty
  sinkNonempty : F.sinkNode ≠ Empty
  capacityNonnegative : ∀ x : Float, x ≥ 0
  maxFlowFinite : F.maxFlowValue > 0
  minCutFinite : F.minCutCapacity > 0
  maxFlowMinCutClosed : F.maxFlowMinCutTheorem

def FlowNetworkClosed (F : FlowNetworkPackage) : Prop :=
  F.sourceNode ≠ Empty ∧ F.sinkNode ≠ Empty ∧
  F.maxFlowValue > 0 ∧ F.minCutCapacity > 0 ∧
  F.maxFlowMinCutTheorem

theorem flow_network_closed_from_evidence (F : FlowNetworkPackage)
    (E : FlowNetworkEvidence F) : FlowNetworkClosed F := by
  exact And.intro E.sourceNonempty
    (And.intro E.sinkNonempty
      (And.intro E.maxFlowFinite
        (And.intro E.minCutFinite E.maxFlowMinCutClosed)))

end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
end HautevilleHouse
