import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean.HiddenMarkovStateSpace

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean

structure FilteringSmoothingPackage {S : HiddenStateSpace} where
  filteringDistribution : Prop
  smoothingDistribution : Prop
  predictionDistribution : Prop
  backwardSmoothingRecursion : Prop
  filteringDistributionClosed : filteringDistribution
  smoothingDistributionClosed : smoothingDistribution
  predictionDistributionClosed : predictionDistribution
  backwardSmoothingRecursionClosed : backwardSmoothingRecursion

structure FilteringSmoothingEvidence {S : HiddenStateSpace}
    (F : FilteringSmoothingPackage S) where
  filteringDistributionClosed : F.filteringDistribution
  smoothingDistributionClosed : F.smoothingDistribution
  predictionDistributionClosed : F.predictionDistribution
  backwardSmoothingRecursionClosed : F.backwardSmoothingRecursion

def FilteringSmoothingClosed {S : HiddenStateSpace}
    (F : FilteringSmoothingPackage S) : Prop :=
  F.filteringDistribution ∧ F.smoothingDistribution ∧
  F.predictionDistribution ∧ F.backwardSmoothingRecursion

theorem filtering_smoothing_closed_from_evidence {S : HiddenStateSpace}
    (F : FilteringSmoothingPackage S) (E : FilteringSmoothingEvidence F) :
    FilteringSmoothingClosed F := by
  exact And.intro E.filteringDistributionClosed
    (And.intro E.smoothingDistributionClosed
      (And.intro E.predictionDistributionClosed E.backwardSmoothingRecursionClosed))

end MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean
end HautevilleHouse
