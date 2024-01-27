contract c16652{
	/// @return integer representing the index of the current sale round
    function currentStepIndexAll() internal view returns (uint8 roundNum) {
        roundNum = currentStepIndexByDate();
        /// round determined by conjunction of both time and total sold tokens
        while(roundNum < 3 && StepCaps[roundNum]<= 0) {
            roundNum++;
        }
    }
}