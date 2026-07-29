import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean.HiddenMarkovModel
import HautevilleHouse.MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean.ForwardBackwardAlgorithm
import HautevilleHouse.MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean.BaumWelchAlgorithm
import HautevilleHouse.MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean.ViterbiAlgorithm
import HautevilleHouse.MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean.KalmanFilter

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | HiddenMarkovModel m => HiddenMarkovClosed m
  | ForwardBackwardAlgorithm f => ForwardBackwardClosed f
  | BaumWelchAlgorithm b => BaumWelchClosed b
  | ViterbiAlgorithm v => ViterbiClosed v
  | KalmanFilter k => KalmanFilterClosed k

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  sorry

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedMarkovEstimationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_markov_estimation_endgame (A : AdmissibleClass) :
    ConstrainedMarkovEstimationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean
end HautevilleHouse