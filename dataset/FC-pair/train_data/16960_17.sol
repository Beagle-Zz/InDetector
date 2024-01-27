contract c16960{
  /*
   * Proxy transfer HC token. When some users of the ethereum account don't have ether,
   * Who can authorize the agent for broadcast transactions, the agents may charge fees
   * @param _from
   * @param _to
   * @param _value
   * @param fee
   * @param _v
   * @param _r
   * @param _s
   * @param _comment
   */
  function transferProxy(address _from, address _to, uint256 _value, uint256 _fee,
      uint8 _v, bytes32 _r, bytes32 _s) whenNotPaused {
      require((balances[_from] >= _fee.add(_value)));
      require(balances[_to].add(_value) >= balances[_to]);
      require(balances[msg.sender].add(_fee) >= balances[msg.sender]);
      uint256 nonce = nonces[_from];
      bytes32 hash = keccak256(_from,_to,_value,_fee,nonce);
      bytes memory prefix = "\x19Ethereum Signed Message:\n32";
      bytes32 prefixedHash = keccak256(prefix, hash);
      require(_from == ecrecover(prefixedHash,_v,_r,_s));
      balances[_from] = balances[_from].sub(_value.add(_fee));
      balances[_to] = balances[_to].add(_value);
      balances[msg.sender] = balances[msg.sender].add(_fee);
      nonces[_from] = nonce.add(1);
      emit Transfer(_from, _to, _value);
      emit Transfer(_from, msg.sender, _fee);
  }
}