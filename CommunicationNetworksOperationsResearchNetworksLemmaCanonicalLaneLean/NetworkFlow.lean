import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure NetworkFlowPackage where
  source : Type u
  sink : Type u
  capacity : Float
  flow : Float
  capacityConstraint : Prop
  flowConservation : Prop

structure NetworkFlowEvidence (N : NetworkFlowPackage) where
  capacityClosed : N.capacity > 0
  flowClosed : N.flow ≥ 0
  capacityConstraintClosed : N.capacityConstraint ↔ N.flow ≤ N.capacity
  flowConservationClosed : N.flowConservation

def NetworkFlowClosed (N : NetworkFlowPackage) : Prop :=
  N.capacity > 0 ∧
  N.flow ≥ 0 ∧
  (N.capacityConstraint ↔ N.flow ≤ N.capacity) ∧
  N.flowConservation

theorem network_flow_closed_from_evidence (N : NetworkFlowPackage) (E : NetworkFlowEvidence N) : NetworkFlowClosed N := by
  exact And.intro E.capacityClosed (And.intro E.flowClosed (And.intro E.capacityConstraintClosed E.flowConservationClosed))

end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
end HautevilleHouse