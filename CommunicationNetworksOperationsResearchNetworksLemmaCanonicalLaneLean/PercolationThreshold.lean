import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure PercolationPackage where
  infiniteGraph : Type
  edgeRetentionProbability : Float
  infiniteClusterExists : Prop
  criticalThreshold : Float
  clusterSizeDistribution : List Float

structure PercolationEvidence (P : PercolationPackage) where
  graphInfinite : P.infiniteGraph ≠ Empty
  probabilityInUnitInterval : 0 < P.edgeRetentionProbability ∧ P.edgeRetentionProbability ≤ 1
  infiniteClusterClosed : P.infiniteClusterExists
  thresholdPositive : P.criticalThreshold > 0
  thresholdLessThanOne : P.criticalThreshold < 1
  clusterDistributionNonnegative : ∀ x ∈ P.clusterSizeDistribution, x ≥ 0

def PercolationClosed (P : PercolationPackage) : Prop :=
  P.infiniteGraph ≠ Empty ∧ (0 < P.edgeRetentionProbability ∧ P.edgeRetentionProbability ≤ 1) ∧
  P.infiniteClusterExists ∧ P.criticalThreshold > 0 ∧ P.criticalThreshold < 1 ∧
  ∀ x ∈ P.clusterSizeDistribution, x ≥ 0

theorem percolation_closed_from_evidence (P : PercolationPackage)
    (E : PercolationEvidence P) : PercolationClosed P := by
  exact And.intro E.graphInfinite
    (And.intro E.probabilityInUnitInterval
      (And.intro E.infiniteClusterClosed
        (And.intro E.thresholdPositive
          (And.intro E.thresholdLessThanOne E.clusterDistributionNonnegative))))

end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
end HautevilleHouse
