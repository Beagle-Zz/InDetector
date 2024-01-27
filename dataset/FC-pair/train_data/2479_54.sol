contract c2479{
    /**
     * @notice mints new tokens and assigns them to the target _investor.
     * @dev Can only be called by the STO attached to the token (Or by the ST owner if there's no STO attached yet)
     * @param _investor Address to whom the minted tokens will be dilivered
     * @param _amount Number of tokens get minted
     * @return success
     */
    function mint(address _investor, uint256 _amount) public onlyModule(STO_KEY, true) checkGranularity(_amount) isMintingAllowed() returns (bool success) {
        require(_investor != address(0), "Investor address should not be 0x");
        adjustInvestorCount(address(0), _investor, _amount);
        require(verifyTransfer(address(0), _investor, _amount), "Transfer is not valid");
        adjustBalanceCheckpoints(_investor);
        adjustTotalSupplyCheckpoints();
        totalSupply_ = totalSupply_.add(_amount);
        balances[_investor] = balances[_investor].add(_amount);
        emit Minted(_investor, _amount);
        emit Transfer(address(0), _investor, _amount);
        return true;
    }
}