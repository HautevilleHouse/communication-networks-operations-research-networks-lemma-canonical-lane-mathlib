import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure NetworkGraphPackage where
  adjacencyMatrix : Type
  laplacianMatrix : Type
  spectrum : List Float
  spectralRadius : Float
  algebraicConnectivity : Float
  expanderMixing : Prop

structure SpectralEvidence (N : NetworkGraphPackage) where
  adjacencyConsistent : N.adjacencyMatrix ≠ Empty
  laplacianDefined : N.laplacianMatrix ≠ Empty
  spectrumComputed : N.spectrum.length ≥ 1
  spectralRadiusPositive : N.spectralRadius > 0
  algebraicConnectivityNonnegative : N.algebraicConnectivity ≥ 0
  expanderMixingClosed : N.expanderMixing

def NetworkSpectraClosed (N : NetworkGraphPackage) : Prop :=
  N.adjacencyMatrix ≠ Empty ∧ N.laplacianMatrix ≠ Empty ∧
  N.spectrum.length ≥ 1 ∧ N.spectralRadius > 0 ∧
  N.algebraicConnectivity ≥ 0 ∧ N.expanderMixing

theorem network_spectra_closed_from_evidence (N : NetworkGraphPackage)
    (E : SpectralEvidence N) : NetworkSpectraClosed N := by
  exact And.intro E.adjacencyConsistent
    (And.intro E.laplacianDefined
      (And.intro E.spectrumComputed
        (And.intro E.spectralRadiusPositive
          (And.intro E.algebraicConnectivityNonnegative E.expanderMixingClosed))))

end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
end HautevilleHouse
