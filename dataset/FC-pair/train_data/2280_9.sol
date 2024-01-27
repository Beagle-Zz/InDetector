contract c2280{
    /**
    *@dev ERC20 compliant transfer function
    *@param _to Address to send funds to
    *@param _amount Amount of token to send
    *@return true for successful
    */
    function transfer(TokenStorage storage self, address _to, uint _amount) public returns (bool) {
        require(isWhitelisted(self,_to));
        uint balance_owner = self.user_total_balances[msg.sender];
        if (
            _to == msg.sender ||
            _to == address(0) ||
            _amount == 0 ||
            balance_owner < _amount
        ) return false;
        transferHelper(self,msg.sender, _to, _amount);
        self.user_total_balances[msg.sender] = self.user_total_balances[msg.sender].sub(_amount);
        self.user_total_balances[_to] = self.user_total_balances[_to].add(_amount);
        emit Transfer(msg.sender, _to, _amount);
        return true;
    }
}