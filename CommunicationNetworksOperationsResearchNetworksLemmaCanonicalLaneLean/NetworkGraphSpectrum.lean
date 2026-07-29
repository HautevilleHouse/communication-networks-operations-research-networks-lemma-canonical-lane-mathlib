import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure GraphSpectrumPackage where
  adjacencyMatrix : Matrix ℕ ℕ ℕ
  eigenvalues : List ℝ
  spectralRadius : ℝ
  algebraicConnectivity : ℝ
  fiedlerEigenvector : Vector ℝ

structure GraphSpectrumEvidence (G : GraphSpectrumPackage) where
  eigenvaluesComputed : G.eigenvalues = (Matrix.eigenvalues G.adjacencyMatrix).toList
  spectralRadiusComputed : G.spectralRadius = max' (List.map abs G.eigenvalues)
  algebraicConnectivityComputed : G.algebraicConnectivity = (List.sort (·>·) G.eigenvalues).get? 1
  fiedlerEigenvectorComputed : G.fiedlerEigenvector = Vector.ofList ((Matrix.eigenvectors G.adjacencyMatrix).col 1).toList

def GraphSpectrumClosed (G : GraphSpectrumPackage) : Prop :=
  G.eigenvaluesComputed ∧ G.spectralRadiusComputed ∧ G.algebraicConnectivityComputed ∧ G.fiedlerEigenvectorComputed

theorem graph_spectrum_closed_from_evidence (G : GraphSpectrumPackage) (E : GraphSpectrumEvidence G) : GraphSpectrumClosed G := by
  exact And.intro E.eigenvaluesComputed (And.intro E.spectralRadiusComputed (And.intro E.algebraicConnectivityComputed E.fiedlerEigenvectorComputed))

end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
end HautevilleHouse