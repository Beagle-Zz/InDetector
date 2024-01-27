contract c18994{
  /// @dev Called when an address wants to purchase tokens
  /// @param self Stored crowdsale from crowdsale contract
  /// @param _amount amount of wei that the buyer is sending
  /// @return true on succesful purchase
  function receivePurchase(DirectCrowdsaleStorage storage self, uint256 _amount)
                           public
                           returns (bool)
  {
    require(msg.sender != self.owner);
  	require(validPurchase(self));
  	// if the token price increase interval has passed, update the current day and change the token price
  	if ((self.milestoneTimes.length > self.currentMilestone + 1) &&
        (now > self.milestoneTimes[self.currentMilestone + 1]))
    {
        while((self.milestoneTimes.length > self.currentMilestone + 1) &&
              (now > self.milestoneTimes[self.currentMilestone + 1]))
        {
          self.currentMilestone += 1;
        }
        self.tokensPerEth = self.tokenPrice[self.milestoneTimes[self.currentMilestone]];
        emit LogTokenPriceChange(self.tokensPerEth,"Token Price has changed!");
    }
  	uint256 _numTokens; //number of tokens that will be purchased
    uint256 _newBalance; //the new balance of the owner of the crowdsale
    uint256 _weiTokens; //temp calc holder
    uint256 _leftoverWei; //wei change for purchaser
    uint256 _remainder; //temp calc holder
    bool err;
    // Find the number of tokens as a function in wei
    (err,_weiTokens) = _amount.times(self.tokensPerEth);
    require(!err);
    _numTokens = _weiTokens / 1000000000000000000;
    _remainder = _weiTokens % 1000000000000000000;
    _remainder = _remainder / self.tokensPerEth;
    _leftoverWei += _remainder;
    _amount = _amount - _remainder;
    self.leftoverWei[msg.sender] += _leftoverWei;
    // can't overflow because it is under the cap
    self.hasContributed[msg.sender] += _amount;
    assert(_numTokens <= self.token.balanceOf(this));
    // calculate the amount of ether in the owners balance
    (err,_newBalance) = self.ownerBalance.plus(_amount);
    require(!err);
    self.ownerBalance = _newBalance;   // "deposit" the amount
    // can't overflow because it will be under the cap
	  self.withdrawTokensMap[msg.sender] += _numTokens;
    //subtract tokens from owner's share
    (err,_remainder) = self.withdrawTokensMap[self.owner].minus(_numTokens);
    require(!err);
    self.withdrawTokensMap[self.owner] = _remainder;
	  emit LogTokensBought(msg.sender, _numTokens);
    return true;
  }
}