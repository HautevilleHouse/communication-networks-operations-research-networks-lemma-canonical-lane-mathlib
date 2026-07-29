import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure SmallWorldNetworkPackage where
  graph : Graph ℕ
  rewiringProbability : ℝ
  clusteringCoefficient : ℝ
  averagePathLength : ℝ
  isSmallWorld : Prop

structure SmallWorldNetworkEvidence (S : SmallWorldNetworkPackage) where
  clusteringCoefficientClosed : S.clusteringCoefficient = S.graph.clusteringCoefficient
  averagePathLengthClosed : S.averagePathLength = S.graph.averagePathLength
  isSmallWorldClosed : S.isSmallWorld ↔ (S.clusteringCoefficient > 0.5 ∧ S.averagePathLength < log(S.graph.numVertices))

def SmallWorldNetworkClosed (S : SmallWorldNetworkPackage) : Prop :=
  S.clusteringCoefficient = S.graph.clusteringCoefficient ∧
  S.averagePathLength = S.graph.averagePathLength ∧
  (S.isSmallWorld ↔ (S.clusteringCoefficient > 0.5 ∧ S.averagePathLength < log(S.graph.numVertices)))

theorem small_world_network_closed_from_evidence (S : SmallWorldNetworkPackage) (E : SmallWorldNetworkEvidence S) : SmallWorldNetworkClosed S := by
  exact And.intro E.clusteringCoefficientClosed (And.intro E.averagePathLengthClosed E.isSmallWorldClosed)

end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
end HautevilleHouse