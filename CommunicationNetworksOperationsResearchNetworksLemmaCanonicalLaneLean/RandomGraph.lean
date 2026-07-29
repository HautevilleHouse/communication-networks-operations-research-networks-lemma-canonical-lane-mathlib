import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure RandomGraphPackage where
  modelType : String
  numVertices : Nat
  edgeProbability : Float
  degreeDistribution : List Float
  connectivity : Prop

structure RandomGraphEvidence (R : RandomGraphPackage) where
  numVerticesClosed : R.numVertices > 0
  edgeProbClosed : R.edgeProbability ∈ Set.Ioo (0 : Float) 1
  degreeDistClosed : R.degreeDistribution.length = R.numVertices
  connectivityClosed : R.connectivity ↔ (R.edgeProbability > Float.log R.numVertices / R.numVertices)

def RandomGraphClosed (R : RandomGraphPackage) : Prop :=
  R.numVertices > 0 ∧
  R.edgeProbability > 0 ∧ R.edgeProbability < 1 ∧
  R.degreeDistribution.length = R.numVertices ∧
  (R.connectivity ↔ (R.edgeProbability > Float.log (Nat.toFloat R.numVertices) / Nat.toFloat R.numVertices))

theorem random_graph_closed_from_evidence (R : RandomGraphPackage) (E : RandomGraphEvidence R) : RandomGraphClosed R := by
  rcases E.edgeProbClosed with ⟨hp1, hp2⟩
  refine And.intro E.numVerticesClosed (And.intro hp1 (And.intro hp2 (And.intro E.degreeDistClosed E.connectivityClosed)))

end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
end HautevilleHouse