import CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean.NetworkReliability

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure NetworkAnalyticFoundation where
  graphSpectra : GraphSpectraPackage
  graphSpectraEvidence : GraphSpectraEvidence graphSpectra
  percolation : PercolationPackage
  percolationEvidence : PercolationEvidence percolation
  smallWorld : SmallWorldPackage
  smallWorldEvidence : SmallWorldEvidence smallWorld
  randomGraph : RandomGraphPackage
  randomGraphEvidence : RandomGraphEvidence randomGraph
  networkFlow : NetworkFlowPackage
  networkFlowEvidence : NetworkFlowEvidence networkFlow
  networkReliability : NetworkReliabilityPackage
  networkReliabilityEvidence : NetworkReliabilityEvidence networkReliability

def NetworkAnalyticFoundationClosed (A : NetworkAnalyticFoundation) : Prop :=
  GraphSpectraClosed A.graphSpectra ∧
  PercolationClosed A.percolation ∧
  SmallWorldClosed A.smallWorld ∧
  RandomGraphClosed A.randomGraph ∧
  NetworkFlowClosed A.networkFlow ∧
  NetworkReliabilityClosed A.networkReliability

theorem network_analytic_foundation_closed_from_evidence (A : NetworkAnalyticFoundation) :
    NetworkAnalyticFoundationClosed A := by
  exact And.intro (graph_spectra_closed_from_evidence A.graphSpectra A.graphSpectraEvidence)
    (And.intro (percolation_closed_from_evidence A.percolation A.percolationEvidence)
      (And.intro (small_world_closed_from_evidence A.smallWorld A.smallWorldEvidence)
        (And.intro (random_graph_closed_from_evidence A.randomGraph A.randomGraphEvidence)
          (And.intro (network_flow_closed_from_evidence A.networkFlow A.networkFlowEvidence)
            (network_reliability_closed_from_evidence A.networkReliability A.networkReliabilityEvidence)))))

end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
end HautevilleHouse