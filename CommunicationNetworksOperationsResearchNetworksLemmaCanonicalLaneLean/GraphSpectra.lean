import CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure GraphSpectraPackage where
  adjacencyMatrix : Type u
  laplacianMatrix : Type v
  eigenvalues : Type w
  spectralRadius : Prop
  eigenvalueDistribution : Prop
  spectralGap : Prop
  algebraicConnectivity : Prop

structure GraphSpectraEvidence (G : GraphSpectraPackage) where
  spectralRadiusClosed : G.spectralRadius
  eigenvalueDistributionClosed : G.eigenvalueDistribution
  spectralGapClosed : G.spectralGap
  algebraicConnectivityClosed : G.algebraicConnectivity

def GraphSpectraClosed (G : GraphSpectraPackage) : Prop :=
  G.spectralRadius ∧ G.eigenvalueDistribution ∧ G.spectralGap ∧ G.algebraicConnectivity

theorem graph_spectra_closed_from_evidence (G : GraphSpectraPackage) (E : GraphSpectraEvidence G) :
    GraphSpectraClosed G := by
  exact And.intro E.spectralRadiusClosed
    (And.intro E.eigenvalueDistributionClosed
      (And.intro E.spectralGapClosed E.algebraicConnectivityClosed))

end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
end HautevilleHouse