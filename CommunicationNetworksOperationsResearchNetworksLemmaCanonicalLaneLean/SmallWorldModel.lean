import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure SmallWorldPackage where
  nodeCount : Nat
  rewiringProbability : Float
  clusteringCoefficient : Float
  averagePathLength : Float
  smallWorldProperty : Prop

structure SmallWorldEvidence (S : SmallWorldPackage) where
  nodesPositive : S.nodeCount > 0
  rewiringInUnitInterval : 0 ≤ S.rewiringProbability ∧ S.rewiringProbability ≤ 1
  clusteringInUnitInterval : 0 ≤ S.clusteringCoefficient ∧ S.clusteringCoefficient ≤ 1
  pathLengthFinite : S.averagePathLength > 0
  smallWorldClosed : S.smallWorldProperty

def SmallWorldClosed (S : SmallWorldPackage) : Prop :=
  S.nodeCount > 0 ∧ (0 ≤ S.rewiringProbability ∧ S.rewiringProbability ≤ 1) ∧
  (0 ≤ S.clusteringCoefficient ∧ S.clusteringCoefficient ≤ 1) ∧
  S.averagePathLength > 0 ∧ S.smallWorldProperty

theorem small_world_closed_from_evidence (S : SmallWorldPackage)
    (E : SmallWorldEvidence S) : SmallWorldClosed S := by
  exact And.intro E.nodesPositive
    (And.intro E.rewiringInUnitInterval
      (And.intro E.clusteringInUnitInterval
        (And.intro E.pathLengthFinite E.smallWorldClosed)))

end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
end HautevilleHouse
