import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure QueuingNetworkPackage where
  arrivalRate : Float
  serviceRate : Float
  numServers : Nat
  utilization : Float
  stationaryDistExists : Prop

structure QueuingNetworkEvidence (Q : QueuingNetworkPackage) where
  arrivalClosed : Q.arrivalRate > 0
  serviceClosed : Q.serviceRate > 0
  numServersClosed : Q.numServers > 0
  utilizationClosed : Q.utilization = Q.arrivalRate / (Q.serviceRate * Nat.toFloat Q.numServers)
  stationaryClosed : Q.stationaryDistExists ↔ Q.utilization < 1

def QueuingNetworkClosed (Q : QueuingNetworkPackage) : Prop :=
  Q.arrivalRate > 0 ∧
  Q.serviceRate > 0 ∧
  Q.numServers > 0 ∧
  Q.utilization = Q.arrivalRate / (Q.serviceRate * Nat.toFloat Q.numServers) ∧
  (Q.stationaryDistExists ↔ Q.utilization < 1)

theorem queuing_network_closed_from_evidence (Q : QueuingNetworkPackage) (E : QueuingNetworkEvidence Q) : QueuingNetworkClosed Q := by
  refine And.intro E.arrivalClosed (And.intro E.serviceClosed (And.intro E.numServersClosed (And.intro E.utilizationClosed E.stationaryClosed)))

end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
end HautevilleHouse