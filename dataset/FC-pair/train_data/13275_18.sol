contract c13275{
    /**
     * @notice Transfer tokens from one address to another
     * @param _signature bytes The signature, issued by the spender.
     * @param _from address The address which you want to send tokens from.
     * @param _to address The address which you want to transfer to.
     * @param _value uint256 The amount of tokens to be transferred.
     * @param _fee uint256 The amount of tokens paid to msg.sender, by the spender.
     * @param _nonce uint256 Presigned transaction number.
     */
    function transferFromPreSigned(
        bytes _signature,
        address _from,
        address _to,
        uint256 _value,
        uint256 _fee,
        uint256 _nonce
    )
        public
        returns (bool)
    {
        require(_to != address(0));
        require(!nonces[_signature]);
        bytes32 hashedTx = transferFromPreSignedHashing(address(this), _from, _to, _value, _fee, _nonce);
        address spender = recover(hashedTx, _signature);
        require(spender != address(0));
        nonces[_signature] = true;
        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        allowed[_from][spender] = allowed[_from][spender].sub(_value);
        balances[spender] = balances[spender].sub(_fee);
        balances[msg.sender] = balances[msg.sender].add(_fee);
        nonces[_signature] = true;
        emit Transfer(_from, _to, _value);
        emit Transfer(spender, msg.sender, _fee);
        return true;
    }
}