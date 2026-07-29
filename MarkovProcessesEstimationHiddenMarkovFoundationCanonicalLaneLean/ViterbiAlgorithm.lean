import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean.HiddenMarkovModel

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean

structure ViterbiAlgorithm (M : HiddenMarkovModel) where
  mostLikelyStateSequence : M.observationSpace → M.stateSpace
  viterbiRecurrence : Prop
  optimalPathProperty : Prop

structure ViterbiEvidence {M : HiddenMarkovModel}
    (V : ViterbiAlgorithm M) where
  viterbiRecurrenceClosed : V.viterbiRecurrence
  optimalPathPropertyClosed : V.optimalPathProperty

def ViterbiClosed {M : HiddenMarkovModel} (V : ViterbiAlgorithm M) : Prop :=
  V.viterbiRecurrence ∧ V.optimalPathProperty

theorem viterbi_closed_from_evidence {M : HiddenMarkovModel}
    (V : ViterbiAlgorithm M) (E : ViterbiEvidence V) : ViterbiClosed V := by
  exact And.intro E.viterbiRecurrenceClosed E.optimalPathPropertyClosed

end MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean
end HautevilleHouse