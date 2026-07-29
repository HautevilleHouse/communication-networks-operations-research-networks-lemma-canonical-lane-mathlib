import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure NetworkObject where
  graphType : Type
  spectralGap : Prop
  percolationThreshold : Prop
  smallWorldProperty : Prop
  conclusion : spectralGap ∧ percolationThreshold ∧ smallWorldProperty

structure AdmissibleClass where
  object : NetworkObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  NetworkWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
end HautevilleHouse