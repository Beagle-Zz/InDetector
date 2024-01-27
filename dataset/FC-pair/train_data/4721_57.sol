contract c4721{
    /**
    * @dev Transfer tokens to advisors from the advisor's pool
    * @param _beneficiaries address[] list of beneficiaries
    * @param _amounts uint256[] amounts to airdrop
    */
    function allocateAdvisorTokens(address[] _beneficiaries, uint256[] _amounts) external onlyOwner {
        PausableToken(token).unpause();
        advisorPool.allocate(_beneficiaries, _amounts);
        PausableToken(token).pause();
    }
}