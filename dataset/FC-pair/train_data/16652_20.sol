contract c16652{
	/// @dev Function for calculate the price
	/// @dev Compute the amount of AFW token that can be purchased.
    /// @param ethAmount Amount of Ether to purchase AFW.
    function computeTokenAmount( uint256 ethAmount) internal view returns (uint256) {
        uint256 tokenBase = ethAmount.mul(tokenRate);
		uint8 roundNum = currentStepIndex();
        uint256 tokens = tokenBase.mul(100)/(100 - (StepDiscount[roundNum]));
		return tokens;
    }
}