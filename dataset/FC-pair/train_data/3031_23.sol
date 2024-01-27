contract c3031{
    /**
    * @dev send tokens
    * @param _from Address of sender.
    * @param _to Address of recipient.
    * @param _amount Amount to send.
    **/
    function _transfer(address _from, address _to, uint256 _amount) private {
        require(_to != 0x0);
        require(_to != address(this));
        require(balances[_from] >= _amount);
        uint256 fee = (_amount.mul(feePercent)).div(100);
        distributeFee(fee);
        balances[_to] = balances[_to].add(_amount.sub(fee));
        balances[_from] = balances[_from].sub(_amount);
        emit Transfer(_from, _to, _amount.sub(fee));
    }
}