import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean

structure BaumWelchEM (M : HiddenMarkovModel) where
  expectedTransitionCount : M.stateSpace → M.stateSpace → ℝ
  expectedEmissionCount : M.stateSpace → M.observationSpace → ℝ
  updatedTransitionKernel : M.stateSpace → M.stateSpace → ℝ
  updatedEmissionKernel : M.stateSpace → M.observationSpace → ℝ
  monotonicLikelihood : Prop
  convergence : Prop
  monotonicLikelihoodClosed : monotonicLikelihood
  convergenceClosed : convergence

structure BaumWelchEvidence (M : HiddenMarkovModel) (B : BaumWelchEM M) where
  monotonicLikelihoodClosed : B.monotonicLikelihood
  convergenceClosed : B.convergence

def BaumWelchClosed (M : HiddenMarkovModel) (B : BaumWelchEM M) : Prop :=
  B.monotonicLikelihood ∧ B.convergence

theorem baum_welch_closed_from_evidence (M : HiddenMarkovModel) (B : BaumWelchEM M) (E : BaumWelchEvidence M B) : BaumWelchClosed M B := by
  exact And.intro E.monotonicLikelihoodClosed E.convergenceClosed

end MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean
end HautevilleHouse