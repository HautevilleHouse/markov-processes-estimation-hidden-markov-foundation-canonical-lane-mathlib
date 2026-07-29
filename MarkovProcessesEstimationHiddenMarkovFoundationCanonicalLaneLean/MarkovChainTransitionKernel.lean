import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean

structure MarkovChainTransitionKernelPackage (S : Type u) where
  kernel : S → S → ℝ
  nonnegative : ∀ s t, kernel s t ≥ 0
  sumOne : ∀ s, ∑ t, kernel s t = 1
  stationaryDistribution : S → ℝ
  stationaryCorrect : ∀ s, ∑ t, kernel t s * stationaryDistribution t = stationaryDistribution s
  irreducible : Prop
  aperiodic : Prop

structure MarkovChainTransitionKernelEvidence {S : Type u} (M : MarkovChainTransitionKernelPackage S) where
  nonnegativeClosed : M.nonnegative
  sumOneClosed : M.sumOne
  stationaryCorrectClosed : M.stationaryCorrect
  irreducibleClosed : M.irreducible
  aperiodicClosed : M.aperiodic

def MarkovChainTransitionKernelClosed {S : Type u} (M : MarkovChainTransitionKernelPackage S) : Prop :=
  M.nonnegative ∧ M.sumOne ∧ M.stationaryCorrect ∧ M.irreducible ∧ M.aperiodic

theorem markov_chain_transition_kernel_closed_from_evidence {S : Type u} (M : MarkovChainTransitionKernelPackage S) (E : MarkovChainTransitionKernelEvidence M) : MarkovChainTransitionKernelClosed M := by
  exact And.intro E.nonnegativeClosed (And.intro E.sumOneClosed (And.intro E.stationaryCorrectClosed (And.intro E.irreducibleClosed E.aperiodicClosed)))

end MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean
end HautevilleHouse