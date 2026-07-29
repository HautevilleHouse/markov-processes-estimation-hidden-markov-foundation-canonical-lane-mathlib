import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean

structure HiddenMarkovModel where
  stateSpace : Type u
  observationSpace : Type v
  transitionKernel : stateSpace → stateSpace → ℝ
  emissionKernel : stateSpace → observationSpace → ℝ
  initialDistribution : stateSpace → ℝ
  transitionStochastic : ∀ s, ∑ s', transitionKernel s s' = 1
  emissionStochastic : ∀ s, ∑ o, emissionKernel s o = 1
  initialSum : ∑ s, initialDistribution s = 1

structure HiddenMarkovEvidence (M : HiddenMarkovModel) where
  transitionStochasticClosed : M.transitionStochastic
  emissionStochasticClosed : M.emissionStochastic
  initialSumClosed : M.initialSum

def HiddenMarkovClosed (M : HiddenMarkovModel) : Prop :=
  M.transitionStochastic ∧ M.emissionStochastic ∧ M.initialSum

theorem hidden_markov_closed_from_evidence (M : HiddenMarkovModel) (E : HiddenMarkovEvidence M) : HiddenMarkovClosed M := by
  exact And.intro E.transitionStochasticClosed (And.intro E.emissionStochasticClosed E.initialSumClosed)

end MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean
end HautevilleHouse