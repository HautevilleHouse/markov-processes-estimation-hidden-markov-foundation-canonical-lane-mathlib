import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean.HiddenMarkovModel

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean

structure BaumWelchAlgorithm (M : HiddenMarkovModel) where
  estimatedTransition : M.stateSpace → M.stateSpace → ℝ
  estimatedEmission : M.stateSpace → M.observationSpace → ℝ
  estimatedInitial : M.stateSpace → ℝ
  maxLikelihood : Prop
  convergenceCriterion : Prop

structure BaumWelchEvidence {M : HiddenMarkovModel}
    (B : BaumWelchAlgorithm M) where
  maxLikelihoodClosed : B.maxLikelihood
  convergenceCriterionClosed : B.convergenceCriterion

def BaumWelchClosed {M : HiddenMarkovModel} (B : BaumWelchAlgorithm M) : Prop :=
  B.maxLikelihood ∧ B.convergenceCriterion

theorem baum_welch_closed_from_evidence {M : HiddenMarkovModel}
    (B : BaumWelchAlgorithm M) (E : BaumWelchEvidence B) : BaumWelchClosed B := by
  exact And.intro E.maxLikelihoodClosed E.convergenceCriterionClosed

end MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean
end HautevilleHouse