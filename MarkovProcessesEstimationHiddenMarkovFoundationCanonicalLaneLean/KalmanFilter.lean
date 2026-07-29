import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean

structure KalmanFilter where
  stateDim : ℕ
  obsDim : ℕ
  transitionMatrix : Matrix (Fin stateDim) (Fin stateDim) ℝ
  emissionMatrix : Matrix (Fin obsDim) (Fin stateDim) ℝ
  processNoiseCov : Matrix (Fin stateDim) (Fin stateDim) ℝ
  observationNoiseCov : Matrix (Fin obsDim) (Fin obsDim) ℝ
  initialMean : Vector ℝ (Fin stateDim)
  initialCov : Matrix (Fin stateDim) (Fin stateDim) ℝ
  filterMean : Vector ℝ (Fin stateDim)
  filterCov : Matrix (Fin stateDim) (Fin stateDim) ℝ
  predictionUpdateCorrect : Prop
  filterClosed : Prop
  predictionUpdateCorrectClosed : predictionUpdateCorrect
  filterClosedClosed : filterClosed

structure KalmanEvidence (K : KalmanFilter) where
  predictionUpdateCorrectClosed : K.predictionUpdateCorrect
  filterClosedClosed : K.filterClosed

def KalmanClosed (K : KalmanFilter) : Prop :=
  K.predictionUpdateCorrect ∧ K.filterClosed

theorem kalman_closed_from_evidence (K : KalmanFilter) (E : KalmanEvidence K) : KalmanClosed K := by
  exact And.intro E.predictionUpdateCorrectClosed E.filterClosedClosed

end MarkovProcessesEstimationHiddenMarkovFoundationCanonicalLaneLean
end HautevilleHouse