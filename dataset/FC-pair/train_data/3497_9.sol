contract c3497{
    /**
    * @dev Transfer tokens from one address to another
    * @param _tokenId uint256 is subtoken identifier
    * @param _from address The address which you want to send tokens from
    * @param _to address The address which you want to transfer to
    * @param _value uint256 the amount of tokens to be transferred
    */
    function transferFrom(uint256 _tokenId, address _from, address _to, uint256 _value) existingToken(_tokenId) public returns (bool) {
        address _sender = msg.sender;
        var balances = balance[_tokenId];
        var tokenAllowed = allowed[_tokenId];
        require(_to != address(0));
        require(_value <= balances[_from]);
        require(_value <= tokenAllowed[_from][_sender]);
        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        tokenAllowed[_from][_sender] = tokenAllowed[_from][_sender].sub(_value);
        Transfer(_tokenId, _from, _to, _value);
        return true;
    }
}