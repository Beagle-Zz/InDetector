contract c7570{
    /**
    * @dev Overrides _processPurchase function from Crowdsale.
    * Adds the tokens purchased to the beneficiary.
    * @param _tokenAmount The token amount in wei before multiplied by the rate.
    */
    function _processPurchase(address _beneficiary, uint256 _tokenAmount) internal {
        depositedTokens[_beneficiary] = depositedTokens[_beneficiary].add(_getTokenAmount(_tokenAmount));
    }
}