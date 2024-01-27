contract c3763{
    // Tenderly remove hand from GROWCHAIN and place on another GROWCHAIN
    function transfer(address _to, uint256 _amount) returns (bool success) {
        initialize(msg.sender);
        if (balances[msg.sender] >= _amount
            && _amount > 0) {
            initialize(_to);
            if (balances[_to] + _amount > balances[_to]) {
                balances[msg.sender] -= _amount;
                balances[_to] += _amount;
                Transfer(msg.sender, _to, _amount);
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
}