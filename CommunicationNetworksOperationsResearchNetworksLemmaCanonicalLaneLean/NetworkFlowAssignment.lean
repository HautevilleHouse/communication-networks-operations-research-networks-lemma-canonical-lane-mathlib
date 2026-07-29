import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure NetworkFlowAssignmentPackage where
  sourceNode : Nat
  sinkNode : Nat
  capacities : Matrix (Fin n) (Fin n) Float
  flowAssignment : Matrix (Fin n) (Fin n) Float
  maxFlowValue : Float
  minCutValue : Float
  flowConstraints : Prop
  flowConstraintsTerm : flowConstraints

structure NetworkFlowAssignmentEvidence (N : NetworkFlowAssignmentPackage) where
  flowConstraintsClosed : N.flowConstraints
  flowConservation : ∀ v ∈ Finset.filter (fun x => x ≠ N.sourceNode ∧ x ≠ N.sinkNode) (Finset.range n), (∑ j, N.flowAssignment v j) = (∑ i, N.flowAssignment i v)
  capacityRespected : ∀ i j, N.flowAssignment i j ≤ N.capacities i j
  maxFlowMinCutEquality : N.maxFlowValue = N.minCutValue

def NetworkFlowAssignmentClosed (N : NetworkFlowAssignmentPackage) : Prop :=
  N.flowConstraints ∧ (∀ v ∈ Finset.filter (fun x => x ≠ N.sourceNode ∧ x ≠ N.sinkNode) (Finset.range n), (∑ j, N.flowAssignment v j) = (∑ i, N.flowAssignment i v)) ∧ (∀ i j, N.flowAssignment i j ≤ N.capacities i j) ∧ N.maxFlowValue = N.minCutValue

theorem network_flow_assignment_closed_from_evidence (N : NetworkFlowAssignmentPackage) (E : NetworkFlowAssignmentEvidence N) : NetworkFlowAssignmentClosed N := by
  exact And.intro E.flowConstraintsClosed (And.intro E.flowConservation (And.intro E.capacityRespected E.maxFlowMinCutEquality))

end HautevilleHouse
end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
