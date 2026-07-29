import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure GraphSpectrumPackage where
  adjacencyMatrix : Type u
  eigenvalues : List Float
  spectralRadius : Float
  algebraicConnectivity : Float
  spectralGap : Float

structure GraphSpectrumEvidence (G : GraphSpectrumPackage) where
  eigenvaluesClosed : G.eigenvalues.length > 0
  spectralRadiusClosed : G.spectralRadius ≥ 0
  algebraicConnectivityClosed : G.algebraicConnectivity ≥ 0
  spectralGapClosed : G.spectralGap ≥ 0

def GraphSpectrumClosed (G : GraphSpectrumPackage) : Prop :=
  G.eigenvalues.length > 0 ∧
  G.spectralRadius ≥ 0 ∧
  G.algebraicConnectivity ≥ 0 ∧
  G.spectralGap ≥ 0

theorem graph_spectrum_closed_from_evidence (G : GraphSpectrumPackage) (E : GraphSpectrumEvidence G) :
    GraphSpectrumClosed G := by
  exact And.intro E.eigenvaluesClosed (And.intro E.spectralRadiusClosed (And.intro E.algebraicConnectivityClosed E.spectralGapClosed))

end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
end HautevilleHouse