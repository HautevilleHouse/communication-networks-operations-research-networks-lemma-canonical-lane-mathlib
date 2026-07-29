import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure SpectralGraphClusteringPackage where
  adjacencyMatrix : Matrix (Fin n) (Fin n) Float
  laplacianMatrix : Matrix (Fin n) (Fin n) Float
  eigenvalues : List Float
  fiedlerEigenvalue : Float
  clusterStructure : Prop
  clusterStructureTerm : clusterStructure

structure SpectralGraphClusteringEvidence (S : SpectralGraphClusteringPackage) where
  clusterStructureClosed : S.clusterStructure
  fiedlerThreshold : S.fiedlerEigenvalue < 0.1
  eigenvectorConsistency : S.laplacianMatrix * S.fiedlerEigenvector = S.fiedlerEigenvalue • S.fiedlerEigenvector

def SpectralGraphClusteringClosed (S : SpectralGraphClusteringPackage) : Prop :=
  S.clusterStructure ∧ S.fiedlerEigenvalue < 0.1 ∧ (S.laplacianMatrix * S.fiedlerEigenvector = S.fiedlerEigenvalue • S.fiedlerEigenvector)

theorem spectral_graph_clustering_closed_from_evidence (S : SpectralGraphClusteringPackage) (E : SpectralGraphClusteringEvidence S) : SpectralGraphClusteringClosed S := by
  exact And.intro E.clusterStructureClosed (And.intro E.fiedlerThreshold E.eigenvectorConsistency)

end HautevilleHouse
end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
