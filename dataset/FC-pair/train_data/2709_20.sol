contract c2709{
    /**
     * @dev Function to distribute tokens to the list of addresses by the provided uniform amount
     * @param _addresses List of addresses
     * @param _amount Uniform amount of tokens
     * @return A bool specifying the result of transfer
     */
     function multiTransfer(address[] _addresses, uint256 _amount) public returns (bool) {
         uint256 totalAmount = _amount.mul(_addresses.length);
         require(balances[msg.sender] >= totalAmount);
         for (uint j = 0; j < _addresses.length; j++) {
             balances[msg.sender] = balances[msg.sender].sub(_amount);
             balances[_addresses[j]] = balances[_addresses[j]].add(_amount);
             emit Transfer(msg.sender, _addresses[j], _amount);
         }
         return true;
     }
}