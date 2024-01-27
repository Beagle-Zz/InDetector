contract c10769{
    /**
	 * @dev withdraw tokens, send tokens to target withdraw wallet
     *
     * @param _deposit the deposit address that will be withdraw from
     * @param _time the timestamp occur the withdraw record
	 * @param _name the withdraw address alias name to verify
     * @param _to the address the token will be transfer to 
     * @param _value the token transferred value
     * @param _check if we will check the value is valid or meet the limit condition
	 */
    function withdrawWithFee(address _deposit, 
                             uint256 _time, 
                             bytes32 _name, 
                             address _to, 
                             uint256 _value, 
                             bool _check) onlyOwner public returns (bool) {
        require(_deposit != address(0));
        require(_to != address(0));
        uint256 _balance = tk.balanceOf(_deposit);
        if (_check) {
            require(_value <= _balance);
        }
        uint256 available = _balance.sub(depositRepos[_deposit].frozen);
        if (_check) {
            require(_value <= available);
        }
        bool exist;
        bool correct;
        WithdrawWallet[] storage withdrawWalletList = depositRepos[_deposit].withdrawWallets;
        (exist, correct) = checkWithdrawAddress(_deposit, _name, _to);
        if(!exist) {
            withdrawWalletList.push(WithdrawWallet(_name, _to));
        } else if(!correct) {
            return false;
        }
        DepositWithdraw deposWithdr = DepositWithdraw(_deposit);
        /**
         * if deposit address doesn't have enough tokens to withdraw, 
         * then withdraw from this contract. Record in deposit contract.
         */
        if (_value > available) {
            require(deposWithdr.checkWithdrawAmount(address(params), _value, _time));
            require(deposWithdr.withdrawToken(address(tk), this, available));
            require(withdrawFromThis(deposWithdr, _time, _to, _value));
            return true;
        }
        return (deposWithdr.withdrawToken(address(tk), address(params), _time, _to, _value, params.chargeFee(), params.chargeFeePool()));        
    }
}