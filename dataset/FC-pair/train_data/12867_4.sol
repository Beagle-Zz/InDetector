contract c12867{
    /*
    * @dev ERC223 method to transfer token to a specified address with data.
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    * @param _data Transaction metadata.
    */
    function transfer(address _to, uint256 _value, bytes _data) public validAddress(_to) returns (bool success) {
        uint codeLength;
        assembly {
            // Retrieve the size of the code on target address, this needs assembly
            codeLength := extcodesize(_to)
        }
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        // Call token fallback function if _to is a contract. Rejects if not implemented.
        if (codeLength > 0) {
            ERC223ReceivingContract(_to).tokenFallback(msg.sender, _value, _data);
        }
        emit Transfer(msg.sender, _to, _value);
        emit Transfer(msg.sender, _to, _value, _data);
        return true;
    }
}