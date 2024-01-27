contract c10769{
    /**
     * @dev check if withdraw amount is not valid
     *
     * @param _params the limitation parameters for withdraw
     * @param _value is the number of the token
     * @param _time the timstamp of the withdraw time
     */
    function checkWithdrawAmount(address _params, uint256 _value, uint256 _time) public returns (bool) {
        IDRCWalletMgrParams params = IDRCWalletMgrParams(_params);
        require(_value <= params.singleWithdrawMax());
        require(_value >= params.singleWithdrawMin());
        uint256 daysCount = _time.div(86400); // one day of seconds
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
        return true;
    }
}