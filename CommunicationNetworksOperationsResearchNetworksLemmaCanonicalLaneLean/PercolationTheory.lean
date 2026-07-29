import CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure PercolationPackage where
  bondPercolation : Type u
  sitePercolation : Type v
  percolationThreshold : Prop
  clusterSizeDistribution : Prop
  criticalExponents : Prop
  universalityClass : Prop

structure PercolationEvidence (P : PercolationPackage) where
  percolationThresholdClosed : P.percolationThreshold
  clusterSizeDistributionClosed : P.clusterSizeDistribution
  criticalExponentsClosed : P.criticalExponents
  universalityClassClosed : P.universalityClass

def PercolationClosed (P : PercolationPackage) : Prop :=
  P.percolationThreshold ∧ P.clusterSizeDistribution ∧ P.criticalExponents ∧ P.universalityClass

theorem percolation_closed_from_evidence (P : PercolationPackage) (E : PercolationEvidence P) :
    PercolationClosed P := by
  exact And.intro E.percolationThresholdClosed
    (And.intro E.clusterSizeDistributionClosed
      (And.intro E.criticalExponentsClosed E.universalityClassClosed))

end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
end HautevilleHouse