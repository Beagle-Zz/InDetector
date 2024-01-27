contract c3497{
    /**
    * @dev transfer token for a specified address
    * @param _tokenId uint256 is subtoken identifier
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
    function transfer(uint256 _tokenId, address _to, uint256 _value) existingToken(_tokenId) public returns (bool) {
        require(_to != address(0));
        var _sender = msg.sender;
        var balances = balance[_tokenId];
        require(_to != address(0));
        require(_value <= balances[_sender]);
        // SafeMath.sub will throw if there is not enough balance.
        balances[_sender] = balances[_sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        Transfer(_tokenId, _sender, _to, _value);
        return true;
    }
}