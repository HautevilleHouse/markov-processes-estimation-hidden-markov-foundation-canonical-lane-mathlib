import MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean

structure MarkovTransitionKernelPackage where
  stateSpace : Type u
  transitionKernel : Type v
  initialKernel : Type w
  chapmanKolmogorovHolds : Prop
  kernelRegular : Prop
  transitionConsistent : Prop

structure MarkovTransitionKernelEvidence (K : MarkovTransitionKernelPackage) where
  chapmanKolmogorovHoldsClosed : K.chapmanKolmogorovHolds
  kernelRegularClosed : K.kernelRegular
  transitionConsistentClosed : K.transitionConsistent

def MarkovTransitionKernelClosed (K : MarkovTransitionKernelPackage) : Prop :=
  K.chapmanKolmogorovHolds ∧ K.kernelRegular ∧ K.transitionConsistent

theorem markov_transition_kernel_closed_from_evidence (K : MarkovTransitionKernelPackage) (E : MarkovTransitionKernelEvidence K) :
    MarkovTransitionKernelClosed K := by
  exact And.intro E.chapmanKolmogorovHoldsClosed (And.intro E.kernelRegularClosed E.transitionConsistentClosed)

end MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean
end HautevilleHouse