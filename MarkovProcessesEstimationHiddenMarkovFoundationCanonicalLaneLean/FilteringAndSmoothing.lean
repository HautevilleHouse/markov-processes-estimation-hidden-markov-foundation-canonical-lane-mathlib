import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean.HiddenMarkovModel

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean

structure FilteringAndSmoothing (M : HiddenMarkovModel) where
  filteringDistribution : M.stateSpace → ℝ
  smoothingDistribution : M.stateSpace → ℝ
  predictionDistribution : M.stateSpace → ℝ
  filteringCorrect : Prop
  smoothingCorrect : Prop
  predictionCorrect : Prop

structure FilteringAndSmoothingEvidence {M : HiddenMarkovModel}
    (F : FilteringAndSmoothing M) where
  filteringCorrectClosed : F.filteringCorrect
  smoothingCorrectClosed : F.smoothingCorrect
  predictionCorrectClosed : F.predictionCorrect

def FilteringAndSmoothingClosed {M : HiddenMarkovModel}
    (F : FilteringAndSmoothing M) : Prop :=
  F.filteringCorrect ∧ F.smoothingCorrect ∧ F.predictionCorrect

theorem filtering_and_smoothing_closed_from_evidence {M : HiddenMarkovModel}
    (F : FilteringAndSmoothing M) (E : FilteringAndSmoothingEvidence F) : FilteringAndSmoothingClosed F := by
  exact And.intro E.filteringCorrectClosed
    (And.intro E.smoothingCorrectClosed E.predictionCorrectClosed)

end MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean
end HautevilleHouse