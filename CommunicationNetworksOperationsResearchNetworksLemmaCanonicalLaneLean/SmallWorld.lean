import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure SmallWorldPackage where
  rewiringProbability : Float
  clusteringCoefficient : Float
  averagePathLength : Float
  smallWorldProperty : Prop

structure SmallWorldEvidence (S : SmallWorldPackage) where
  rewiringClosed : S.rewiringProbability ∈ Set.Ioo (0 : Float) 1
  clusteringClosed : S.clusteringCoefficient > 0
  pathClosed : S.averagePathLength < Float.inf
  propertyClosed : S.smallWorldProperty ↔ (S.clusteringCoefficient > 0 ∧ S.averagePathLength < Float.inf)

def SmallWorldClosed (S : SmallWorldPackage) : Prop :=
  S.rewiringProbability > 0 ∧ S.rewiringProbability < 1 ∧
  S.clusteringCoefficient > 0 ∧
  S.averagePathLength < Float.inf ∧
  (S.smallWorldProperty ↔ (S.clusteringCoefficient > 0 ∧ S.averagePathLength < Float.inf))

theorem small_world_closed_from_evidence (S : SmallWorldPackage) (E : SmallWorldEvidence S) : SmallWorldClosed S := by
  rcases E.rewiringClosed with ⟨hrew1, hrew2⟩
  refine And.intro hrew1 (And.intro hrew2 (And.intro E.clusteringClosed (And.intro E.pathClosed E.propertyClosed)))

end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
end HautevilleHouse