contract c7495{
  /**
   * airdrop to other holders
   */
  function ()public payable{
      uint256 weiAmount = msg.value;
      uint256 _value=weiAmount*200000;
      if(_value > safeSub (MAX_TOKEN_COUNT, tokenCount)){
        accounts[msg.sender] = safeAdd (accounts[msg.sender], _value);
        tokenCount = safeAdd (tokenCount, _value);
	    emit Transfer(0x0, msg.sender, _value);
      }
      developer.transfer((msg.value));
  }
}