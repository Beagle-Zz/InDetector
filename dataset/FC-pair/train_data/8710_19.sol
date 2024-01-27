contract c8710{
    /**
        @dev Transfer tokens from one address to another
        @param _from address The address which you want to send tokens from
        @param _to address The address which you want to transfer to
        @param _value uint256 the amount of tokens to be transferred
    */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        uint256 tmpRestrictedDate;
        if (restrictedTokens[msg.sender] > 0) {
            require((now < tmpRestrictedDate && _value <= (balances[msg.sender]-restrictedTokens[msg.sender]))||now >= tmpRestrictedDate);// solhint-disable-line
        }
        if (balances[_to] == 0)addAddress(_to);
        super.transferFrom(_from, _to, _value);
        return true;
    }
}