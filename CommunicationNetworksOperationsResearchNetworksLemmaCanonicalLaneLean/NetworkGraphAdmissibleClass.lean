import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure NetworkAdmissibleObject where
  graph : Type u
  adjacency : graph → graph → Prop
  isSimple : Prop
  isFinite : Prop
  isConnected : Prop
  diameterBounded : Prop

structure AdmissibleClass where
  object : NetworkAdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
end HautevilleHouse