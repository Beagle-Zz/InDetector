contract c4922{
  /**
   * @dev low level token purchase ***DO NOT OVERRIDE***
   * @param _beneficiary Address performing the token purchase
   */
  function buyTokens(address _beneficiary) public payable {
     require(_beneficiary != address(0x0));
     if(state == STATE.PREPREICO){
        require(now >= prePreIcoStartAt && now <= prePreIcoEndAt);
        require(msg.value <= 10 ether);
      }else if(state == STATE.PREICO){
       require(now >= preIcoStartAt && now <= preIcoEndAt);
       require(msg.value <= 15 ether);
      }else if(state == STATE.POSTICO){
        require(now >= icoStartAt && now <= icoEndAt);
        require(msg.value <= 20 ether);
      }
      uint256 weiAmount = msg.value;
      uint256 tokens = _getTokenAmount(weiAmount);
      if(state == STATE.PREPREICO){                 // bonuses
         tokens = tokens.add(tokens.mul(30).div(100));
      }else if(state == STATE.PREICO){
        tokens = tokens.add(tokens.mul(25).div(100));
      }else if(state == STATE.POSTICO){
        tokens = tokens.add(tokens.mul(20).div(100));
      }
     totalSupply_ = totalSupply_.add(tokens);
     balances[msg.sender] = balances[msg.sender].add(tokens);
     emit Transfer(address(0), msg.sender, tokens);
    // update state
     weiRaised = weiRaised.add(weiAmount);
     emit TokenPurchase(msg.sender, _beneficiary, weiAmount, tokens);
     _forwardFunds();
   }
}