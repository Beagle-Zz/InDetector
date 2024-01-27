contract c8551{
    /* Initial supply is  50,000,000 BFL */
    /**
    * @dev mint timelocked tokens
    */
    function mintTimelocked(address _to, uint256 _amount, uint256 _releaseTime)
        onlyOwner canMint returns (TokenTimelock) {
        TokenTimelock timelock = new TokenTimelock(this, _to, _releaseTime);
        mint(timelock, _amount);
        return timelock;
    }
}