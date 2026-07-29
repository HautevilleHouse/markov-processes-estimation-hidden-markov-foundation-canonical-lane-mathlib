import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean.HiddenMarkovStateSpace

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean

structure BaumWelchEMPipeline {S : HiddenStateSpace} where
  forwardAlgorithm : Prop
  backwardAlgorithm : Prop
  expectationStep : Prop
  maximizationStep : Prop
  convergenceGuarantee : Prop
  forwardAlgorithmClosed : forwardAlgorithm
  backwardAlgorithmClosed : backwardAlgorithm
  expectationStepClosed : expectationStep
  maximizationStepClosed : maximizationStep
  convergenceGuaranteeClosed : convergenceGuarantee

structure BaumWelchEMEvidence {S : HiddenStateSpace} (B : BaumWelchEMPipeline S) where
  forwardAlgorithmClosed : B.forwardAlgorithm
  backwardAlgorithmClosed : B.backwardAlgorithm
  expectationStepClosed : B.expectationStep
  maximizationStepClosed : B.maximizationStep
  convergenceGuaranteeClosed : B.convergenceGuarantee

def BaumWelchEMClosed {S : HiddenStateSpace} (B : BaumWelchEMPipeline S) : Prop :=
  B.forwardAlgorithm ∧ B.backwardAlgorithm ∧
  B.expectationStep ∧ B.maximizationStep ∧ B.convergenceGuarantee

theorem baum_welch_em_closed_from_evidence {S : HiddenStateSpace}
    (B : BaumWelchEMPipeline S) (E : BaumWelchEMEvidence B) :
    BaumWelchEMClosed B := by
  exact And.intro E.forwardAlgorithmClosed
    (And.intro E.backwardAlgorithmClosed
      (And.intro E.expectationStepClosed
        (And.intro E.maximizationStepClosed E.convergenceGuaranteeClosed)))

end MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean
end HautevilleHouse
