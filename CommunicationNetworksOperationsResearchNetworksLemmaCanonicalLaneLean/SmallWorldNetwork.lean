import HautevilleHouse.CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean.NetworkGraphAdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure SmallWorldNetwork where
  baseGraph : NetworkAdmissibleObject
  rewiringProbability : ℝ
  clusteringCoefficient : ℝ
  averagePathLength : ℝ
  smallWorldEffect : Prop

structure SmallWorldNetworkEvidence (S : SmallWorldNetwork) where
  smallWorldEffectClosed : S.smallWorldEffect

def SmallWorldNetworkClosed (S : SmallWorldNetwork) : Prop :=
  S.smallWorldEffect

theorem small_world_network_closed_from_evidence (S : SmallWorldNetwork)
    (E : SmallWorldNetworkEvidence S) : SmallWorldNetworkClosed S := by
  exact E.smallWorldEffectClosed

end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
end HautevilleHouse