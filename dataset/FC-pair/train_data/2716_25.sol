contract c2716{
    /// @dev Determines the amount of Scale to create based on the number of seconds that have passed
    /// @param _timeInSeconds is the time passed in seconds to mint for
    /// @return uint with the calculated number of new tokens to mint
    function calculateMintTotal(uint _timeInSeconds, uint _mintRate) pure private returns(uint mintAmount) {
        // Calculates the amount of tokens to mint based upon the number of seconds passed
        return(_timeInSeconds.mul(_mintRate));
    }
}