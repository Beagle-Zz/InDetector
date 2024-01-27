contract c11514{
    /**
	 * @dev withdraw the tokens from the deposit address with charge fee
     *
     * @param _deposit the deposit address
     * @param _time the timestamp the withdraw occurs
     * @param _value the amount of tokens need to be frozen
	 */
    function withdrawWithFee(address _deposit, uint256 _time, uint256 _value) onlyOwner public returns (bool) {
        require(_deposit != address(0));
        uint256 _balance = tk.balanceOf(_deposit);
        require(_value <= _balance);
        // depositRepos[_deposit].balance = _balance;
        uint256 frozenAmount = depositRepos[_deposit].frozen;
        require(_value <= _balance.sub(frozenAmount));
        DepositWithdraw deposWithdr = DepositWithdraw(_deposit);
        return (deposWithdr.withdrawTokenToDefault(address(tk), address(params), _time, _value, params.chargeFee(), params.chargeFeePool()));
    }
}