contract c12505{
    /**
	 * @dev withdraw tokens, send tokens to target
     *
     * @param _token the token address that will be withdraw
     * @param _params the limitation parameters for withdraw
     * @param _time the timstamp of the withdraw time
	 * @param _to is where the tokens will be sent to
	 *        _value is the number of the token
     *        _fee is the amount of the transferring costs
     *        _tokenReturn is the address that return back the tokens of the _fee
	 */
    function withdrawToken(address _token, address _params, uint256 _time, address _to, uint256 _value, uint256 _fee, address _tokenReturn) public onlyOwner whenNotPaused returns (bool) {
        require(_to != address(0));
        require(_token != address(0));
        require(_value > _fee);
        // require(_tokenReturn != address(0));
        DRCWalletMgrParams params = DRCWalletMgrParams(_params);
        require(_value <= params.singleWithdraw());
        uint256 daysCount = _time.div(86400);
        if (daysCount <= dayWithdrawRec.mul) {
            dayWithdrawRec.count = dayWithdrawRec.count.add(1);
            dayWithdrawRec.value = dayWithdrawRec.value.add(_value);
            require(dayWithdrawRec.count <= params.dayWithdrawCount());
            require(dayWithdrawRec.value <= params.dayWithdraw());
        } else {
            dayWithdrawRec.mul = daysCount;
            dayWithdrawRec.count = 1;
            dayWithdrawRec.value = _value;
        }
        uint256 monthsCount = _time.div(86400 * 30);
        if (monthsCount <= monthWithdrawRec.mul) {
            monthWithdrawRec.count = monthWithdrawRec.count.add(1);
            monthWithdrawRec.value = monthWithdrawRec.value.add(_value);
            require(monthWithdrawRec.value <= params.monthWithdraw());
        } else {            
            monthWithdrawRec.mul = monthsCount;
            monthWithdrawRec.count = 1;
            monthWithdrawRec.value = _value;
        }
        ERC20 tk = ERC20(_token);
        uint256 realAmount = _value.sub(_fee);
        require(tk.transfer(_to, realAmount));
        if (_tokenReturn != address(0) && _fee > 0) {
            require(tk.transfer(_tokenReturn, _fee));
        }
        withdrRecs.push(TransferRecord(_time, _to, realAmount));
        emit WithdrawToken(_token, _to, realAmount);
        return true;
    }
}