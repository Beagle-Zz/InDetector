contract c13892{
    /**
     * @dev mint timelocked tokens
    */
    function _mintTimelocked(address _to, uint256 _amount, uint256 _releaseTime)
    internal canMint returns (TokenTimelock) {
        TokenTimelock timelock = new TokenTimelock(this, _to, _releaseTime);
        balancesLocked[_to].push(timelock);
        _mint(timelock, _amount);
        return timelock;
    }
}