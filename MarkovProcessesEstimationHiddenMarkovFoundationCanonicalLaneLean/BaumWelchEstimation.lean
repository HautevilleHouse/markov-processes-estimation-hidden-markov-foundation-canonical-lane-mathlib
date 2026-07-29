import MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean

structure BaumWelchEstimationPackage where
  parameterSpace : Type u
  likelihoodSurface : Type v
  emIterationConverges : Prop
  parameterConsistency : Prop
  mlEstimateConsistent : Prop

structure BaumWelchEstimationEvidence (B : BaumWelchEstimationPackage) where
  emIterationConvergesClosed : B.emIterationConverges
  parameterConsistencyClosed : B.parameterConsistency
  mlEstimateConsistentClosed : B.mlEstimateConsistent

def BaumWelchEstimationClosed (B : BaumWelchEstimationPackage) : Prop :=
  B.emIterationConverges ∧ B.parameterConsistency ∧ B.mlEstimateConsistent

theorem baum_welch_estimation_closed_from_evidence (B : BaumWelchEstimationPackage) (E : BaumWelchEstimationEvidence B) :
    BaumWelchEstimationClosed B := by
  exact And.intro E.emIterationConvergesClosed (And.intro E.parameterConsistencyClosed E.mlEstimateConsistentClosed)

end MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean
end HautevilleHouse