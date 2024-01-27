contract c10769{
    /**
	 * @dev withdraw tokens from this contract, send tokens to target withdraw wallet
     *
     * @param _deposWithdr the deposit contract that will record withdrawing
     * @param _time the timestamp occur the withdraw record
     * @param _to the address the token will be transfer to 
     * @param _value the token transferred value
	 */
    function withdrawFromThis(DepositWithdraw _deposWithdr, uint256 _time, address _to, uint256 _value) private returns (bool) {
        uint256 fee = params.chargeFee();
        uint256 realAmount = _value.sub(fee);
        address tokenReturn = params.chargeFeePool();
        if (tokenReturn != address(0) && fee > 0) {
            require(tk.transfer(tokenReturn, fee));
        }
        require (tk.transfer(_to, realAmount));
        _deposWithdr.recordWithdraw(_time, _to, realAmount);
        return true;
    }
}