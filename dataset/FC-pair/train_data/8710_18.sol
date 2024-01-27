contract c8710{
    /**
     @dev Transfer tokens
          Send `_value` tokens to `_to` from your account
      @param _to The address of the recipient
      @param _value the amount to send
    */
    // solhint-disable-next-line
    function transfer(address _to, uint256 _value) public returns (bool) {
        uint256  tmpRestrictedDate;
        if (restrictedTokens[msg.sender] > 0) {
            require((now < tmpRestrictedDate && _value <= (balances[msg.sender].sub(restrictedTokens[msg.sender])))||now >= tmpRestrictedDate);// solhint-disable-line
        }
        if (balances[_to] == 0) addAddress(_to);
        _transfer(_to, _value);
        return true;
    }
}