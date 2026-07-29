import HautevilleHouse.CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean.NetworkGraphAdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure QueueingModel where
  networkGraph : NetworkAdmissibleObject
  arrivalRate : ℝ
  serviceRate : ℝ
  queueLengthDistribution : Prop
  stabilityCondition : Prop
  throughputOptimality : Prop

structure QueueingModelEvidence (Q : QueueingModel) where
  stabilityConditionClosed : Q.stabilityCondition
  throughputOptimalityClosed : Q.throughputOptimality

def QueueingModelClosed (Q : QueueingModel) : Prop :=
  Q.stabilityCondition ∧ Q.throughputOptimality

theorem queueing_model_closed_from_evidence (Q : QueueingModel)
    (E : QueueingModelEvidence Q) : QueueingModelClosed Q := by
  exact And.intro E.stabilityConditionClosed E.throughputOptimalityClosed

end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
end HautevilleHouse