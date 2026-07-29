import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure QueueingNetworkThroughputPackage where
  serverSet : Type u
  arrivalRates : serverSet → Float
  serviceRates : serverSet → Float
  routingMatrix : Matrix (Fin n) (Fin n) Float
  throughputVector : serverSet → Float
  stabilityCondition : Prop
  stabilityConditionTerm : stabilityCondition

structure QueueingNetworkThroughputEvidence (Q : QueueingNetworkThroughputPackage) where
  stabilityConditionClosed : Q.stabilityCondition
  throughputPositive : ∀ s, Q.throughputVector s > 0
  trafficEquationSatisfied : ∀ i, Q.arrivalRates i + ∑ j, Q.routingMatrix j i * Q.throughputVector j = Q.throughputVector i

def QueueingNetworkThroughputClosed (Q : QueueingNetworkThroughputPackage) : Prop :=
  Q.stabilityCondition ∧ (∀ s, Q.throughputVector s > 0) ∧ (∀ i, Q.arrivalRates i + ∑ j, Q.routingMatrix j i * Q.throughputVector j = Q.throughputVector i)

theorem queueing_network_throughput_closed_from_evidence (Q : QueueingNetworkThroughputPackage) (E : QueueingNetworkThroughputEvidence Q) : QueueingNetworkThroughputClosed Q := by
  exact And.intro E.stabilityConditionClosed (And.intro E.throughputPositive E.trafficEquationSatisfied)

end HautevilleHouse
end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
