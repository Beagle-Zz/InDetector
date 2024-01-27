contract c4717{
    /**
    * @dev Perform an airdrop from the airdrop pool to multiple beneficiaries
    * @param _beneficiaries address[] list of beneficiaries
    * @param _amount uint256 amount to airdrop
    */
    function airdropTokens(address[] _beneficiaries, uint256 _amount) external onlyOwner {
        PausableToken(token).unpause();
        airdropPool.allocateEqual(_beneficiaries, _amount);
        PausableToken(token).pause();
    }
}