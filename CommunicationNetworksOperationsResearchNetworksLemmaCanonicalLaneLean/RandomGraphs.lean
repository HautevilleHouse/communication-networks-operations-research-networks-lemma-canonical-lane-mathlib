import CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean

structure RandomGraphPackage where
  model : Type u
  edgeProbability : Prop
  degreeSequence : Prop
  connectednessThreshold : Prop
  giantComponent : Prop
  phaseTransition : Prop

structure RandomGraphEvidence (R : RandomGraphPackage) where
  edgeProbabilityClosed : R.edgeProbability
  degreeSequenceClosed : R.degreeSequence
  connectednessThresholdClosed : R.connectednessThreshold
  giantComponentClosed : R.giantComponent
  phaseTransitionClosed : R.phaseTransition

def RandomGraphClosed (R : RandomGraphPackage) : Prop :=
  R.edgeProbability ∧ R.degreeSequence ∧ R.connectednessThreshold ∧
  R.giantComponent ∧ R.phaseTransition

theorem random_graph_closed_from_evidence (R : RandomGraphPackage) (E : RandomGraphEvidence R) :
    RandomGraphClosed R := by
  exact And.intro E.edgeProbabilityClosed
    (And.intro E.degreeSequenceClosed
      (And.intro E.connectednessThresholdClosed
        (And.intro E.giantComponentClosed E.phaseTransitionClosed)))

end CommunicationNetworksOperationsResearchNetworksLemmaCanonicalLaneLean
end HautevilleHouse