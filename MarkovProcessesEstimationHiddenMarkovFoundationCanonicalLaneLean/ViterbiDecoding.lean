import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean

structure ViterbiDecoding (M : HiddenMarkovModel) where
  viterbiPath : List M.observationSpace → List M.stateSpace
  viterbiProbability : List M.observationSpace → ℝ
  optimality : ∀ (obs : List M.observationSpace), ∀ (path : List M.stateSpace), 
    probabilityOfPath obs path ≤ viterbiProbability obs
  optimalityClosed : optimality

structure ViterbiEvidence (M : HiddenMarkovModel) (V : ViterbiDecoding M) where
  optimalityClosed : V.optimality

def ViterbiClosed (M : HiddenMarkovModel) (V : ViterbiDecoding M) : Prop :=
  V.optimality

theorem viterbi_closed_from_evidence (M : HiddenMarkovModel) (V : ViterbiDecoding M) (E : ViterbiEvidence M V) : ViterbiClosed M V := by
  exact E.optimalityClosed

end MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean
end HautevilleHouse