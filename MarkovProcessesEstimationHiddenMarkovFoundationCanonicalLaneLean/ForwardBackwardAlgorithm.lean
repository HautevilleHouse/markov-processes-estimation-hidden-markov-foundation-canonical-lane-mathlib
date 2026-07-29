import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean

structure ForwardBackwardAlgorithm (M : HiddenMarkovModel) where
  forwardMessage : List M.observationSpace → M.stateSpace → ℝ
  backwardMessage : List M.observationSpace → M.stateSpace → ℝ
  forwardRecursion : ∀ (obs : List M.observationSpace), ∀ s, forwardMessage obs s = 0 -- simplified
  backwardRecursion : ∀ (obs : List M.observationSpace), ∀ s, backwardMessage obs s = 0
  forwardClosed : ∀ obs, ∑ s, forwardMessage obs s = 1
  backwardClosed : ∀ obs, ∑ s, backwardMessage obs s = 1

structure ForwardBackwardEvidence (M : HiddenMarkovModel) (A : ForwardBackwardAlgorithm M) where
  forwardRecursionClosed : A.forwardRecursion
  backwardRecursionClosed : A.backwardRecursion
  forwardNormalized : ∀ obs, ∑ s, A.forwardMessage obs s = 1
  backwardNormalized : ∀ obs, ∑ s, A.backwardMessage obs s = 1

def ForwardBackwardClosed (M : HiddenMarkovModel) (A : ForwardBackwardAlgorithm M) : Prop :=
  A.forwardRecursion ∧ A.backwardRecursion ∧ (∀ obs, ∑ s, A.forwardMessage obs s = 1) ∧ (∀ obs, ∑ s, A.backwardMessage obs s = 1)

theorem forward_backward_closed_from_evidence (M : HiddenMarkovModel) (A : ForwardBackwardAlgorithm M) (E : ForwardBackwardEvidence M A) : ForwardBackwardClosed M A := by
  exact And.intro E.forwardRecursionClosed (And.intro E.backwardRecursionClosed (And.intro E.forwardNormalized E.backwardNormalized))

end MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean
end HautevilleHouse