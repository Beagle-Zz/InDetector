contract c10343{
    /**
     * @dev Throws an exception if maximumSupply will be exceeded after minting
     * @param _amount The amount of tokens to mint
     */
    modifier maximumSupplyWasNotReached(uint256 _amount) {
        require(totalSupply.add(_amount) <= maximumSupply);
        _;
    }
}