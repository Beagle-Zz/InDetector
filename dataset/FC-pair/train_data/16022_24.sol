contract c16022{
    /**
     * @dev Function to mint tokens, and lock some of them with a release time
     * @param _to The address that will receive the minted tokens.
     * @param _amount The amount of tokens to mint.
     * @param _lockedAmount The amount of tokens to be locked.
     * @param _releaseTime The timestamp about to release, which could be set just once.
     * @return A boolean that indicates if the operation was successful.
     */
    function mintWithLock(address _to, uint256 _amount, uint256 _lockedAmount, uint256 _releaseTime) external returns (bool) {
        require(mintAgents[msg.sender] && totalSupply_.add(_amount) <= cap);
        require(_amount >= _lockedAmount);
        totalSupply_ = totalSupply_.add(_amount);
        balances[_to] = balances[_to].add(_amount);
        lockedBalanceMap[_to] = lockedBalanceMap[_to] > 0 ? lockedBalanceMap[_to].add(_lockedAmount) : _lockedAmount;
        releaseTimeMap[_to] = releaseTimeMap[_to] > 0 ? releaseTimeMap[_to] : _releaseTime;
        emit Mint(_to, _amount);
        emit Transfer(address(0), _to, _amount);
        emit BalanceLocked(_to, _lockedAmount);
        return true;
    }
}