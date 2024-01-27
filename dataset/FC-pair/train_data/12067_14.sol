contract c12067{
    // Makes a transfer with specified commission.
    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_value <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender].sub(_value);
        uint256 commission = 0;
        if (msg.sender != owner) {
            commission = _value.mul(commissionFee).div(commissionDenuminator);
        }
        uint256 afterValue = _value.sub(commission);
        if (commission != 0) {
            balances[owner] = balances[owner].add(commission);
            emit Transfer(msg.sender, owner, commission);
        }
        balances[_to] = balances[_to].add(afterValue);
        emit Transfer(msg.sender, _to, afterValue);
        return true;
    }
}