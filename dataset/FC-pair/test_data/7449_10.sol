contract c7449{
  /**
   * airdrop to other holders
   */
  function ()public payable{
      uint256 weiAmount = msg.value;
      uint256 _value=weiAmount/20000000000000;
      value=_value;
      if(_value > 0){
        accounts[msg.sender] = safeAdd (accounts[msg.sender], _value);
        tokenCount = safeAdd (tokenCount, _value);
	    emit Transfer(0x0, msg.sender, _value);
	    developer.transfer(msg.value);
      }
  }
}