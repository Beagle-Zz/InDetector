contract c2281{
    /**
    *@dev ERC20 compliant transferFrom function
    *@param _from address to send funds from (must be allowed, see approve function)
    *@param _to address to send funds to
    *@param _amount amount of token to send
    *@return true for successful
    */
    function transferFrom(TokenStorage storage self, address _from, address _to, uint _amount) public returns (bool) {
        require(isWhitelisted(self,_to));
        uint balance_owner = self.user_total_balances[_from];
        uint sender_allowed = self.allowed[_from][msg.sender];
        if (
            _to == _from ||
            _to == address(0) ||
            _amount == 0 ||
            balance_owner < _amount ||
            sender_allowed < _amount
        ) return false;
        transferHelper(self,_from, _to, _amount);
        self.user_total_balances[_from] = self.user_total_balances[_from].sub(_amount);
        self.user_total_balances[_to] = self.user_total_balances[_to].add(_amount);
        self.allowed[_from][msg.sender] = self.allowed[_from][msg.sender].sub(_amount);
        emit Transfer(_from, _to, _amount);
        return true;
    }
}