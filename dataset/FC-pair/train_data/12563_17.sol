contract c12563{
    /// @dev Checks whether a given order was valid
    /// @param amountObtained Amount of the order which was obtained
    /// @param amountGiven Amount given in return for amountObtained
    /// @param amountToObtain Amount we intended to obtain
    /// @param amountToGive Amount we intended to give in return for amountToObtain
    /// @return Boolean value indicating whether this order was valid
    function orderWasValid(uint256 amountObtained, uint256 amountGiven, uint256 amountToObtain, uint256 amountToGive) internal pure returns (bool) {
        if(amountObtained > 0 && amountGiven > 0) {
            // NOTE - Check the edge cases here
            if(amountObtained > amountGiven) {
                return SafeMath.div(amountToObtain, amountToGive) <= SafeMath.div(amountObtained, amountGiven);
            } else {
                return SafeMath.div(amountToGive, amountToObtain) >= SafeMath.div(amountGiven, amountObtained);
            }
        }
        return false;
    }
}