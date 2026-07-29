import HautevilleHouse.CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean.NetworkGraphAdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure ErdosRenyiRandomGraph where
  n : ℕ
  p : ℝ
  sampledGraph : NetworkAdmissibleObject
  expectedEdges : ℕ
  connectivityThreshold : ℝ
  giantComponentExists : Prop
  diameterProperty : Prop

structure ErdosRenyiEvidence (G : ErdosRenyiRandomGraph) where
  giantComponentExistsClosed : G.giantComponentExists
  diameterPropertyClosed : G.diameterProperty

def ErdosRenyiClosed (G : ErdosRenyiRandomGraph) : Prop :=
  G.giantComponentExists ∧ G.diameterProperty

theorem erdos_renyi_closed_from_evidence (G : ErdosRenyiRandomGraph)
    (E : ErdosRenyiEvidence G) : ErdosRenyiClosed G := by
  exact And.intro E.giantComponentExistsClosed E.diameterPropertyClosed

end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
end HautevilleHouse