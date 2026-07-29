import MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean

structure FilteringSmoothingPackage where
  stateEstimate : Type u
  filterRecursion : Type v
  smootherRecursion : Type w
  filterOptimal : Prop
  smootherOptimal : Prop
  filterSmootherConsistency : Prop

structure FilteringSmoothingEvidence (F : FilteringSmoothingPackage) where
  filterOptimalClosed : F.filterOptimal
  smootherOptimalClosed : F.smootherOptimal
  filterSmootherConsistencyClosed : F.filterSmootherConsistency

def FilteringSmoothingClosed (F : FilteringSmoothingPackage) : Prop :=
  F.filterOptimal ∧ F.smootherOptimal ∧ F.filterSmootherConsistency

theorem filtering_smoothing_closed_from_evidence (F : FilteringSmoothingPackage) (E : FilteringSmoothingEvidence F) :
    FilteringSmoothingClosed F := by
  exact And.intro E.filterOptimalClosed (And.intro E.smootherOptimalClosed E.filterSmootherConsistencyClosed)

end MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean
end HautevilleHouse