import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean

structure HiddenStateSpace where
  hiddenStateType : Type u
  observationType : Type v
  timeDomain : Type w
  initialDistribution : Prop
  transitionKernel : Prop
  observationKernel : Prop
  hiddenStateTypeNonempty : Nonempty hiddenStateType
  observationTypeNonempty : Nonempty observationType
  initialDistributionDefined : initialDistribution
  transitionKernelDefined : transitionKernel
  observationKernelDefined : observationKernel

structure HiddenStateSpaceEvidence (S : HiddenStateSpace) where
  initialDistributionClosed : S.initialDistribution
  transitionKernelClosed : S.transitionKernel
  observationKernelClosed : S.observationKernel

def HiddenStateSpaceClosed (S : HiddenStateSpace) : Prop :=
  S.initialDistribution ∧ S.transitionKernel ∧ S.observationKernel

theorem hidden_state_space_closed_from_evidence (S : HiddenStateSpace)
    (E : HiddenStateSpaceEvidence S) : HiddenStateSpaceClosed S := by
  exact And.intro E.initialDistributionClosed
    (And.intro E.transitionKernelClosed E.observationKernelClosed)

end MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean
end HautevilleHouse
