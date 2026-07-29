import CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure NetworkReliabilityPackage where
  failureModel : Type u
  redundancy : Prop
  faultTolerance : Prop
  connectivityRobustness : Prop
  availability : Prop
  resilience : Prop

structure NetworkReliabilityEvidence (R : NetworkReliabilityPackage) where
  redundancyClosed : R.redundancy
  faultToleranceClosed : R.faultTolerance
  connectivityRobustnessClosed : R.connectivityRobustness
  availabilityClosed : R.availability
  resilienceClosed : R.resilience

def NetworkReliabilityClosed (R : NetworkReliabilityPackage) : Prop :=
  R.redundancy ∧ R.faultTolerance ∧ R.connectivityRobustness ∧
  R.availability ∧ R.resilience

theorem network_reliability_closed_from_evidence (R : NetworkReliabilityPackage) (E : NetworkReliabilityEvidence R) :
    NetworkReliabilityClosed R := by
  exact And.intro E.redundancyClosed
    (And.intro E.faultToleranceClosed
      (And.intro E.connectivityRobustnessClosed
        (And.intro E.availabilityClosed E.resilienceClosed)))

end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
end HautevilleHouse