contract c7195{
  // @dev Pay with Merculet.
  function payWithMerculet(uint256 _amount)
    whenNotPaused
    public
  {
    require(msg.sender != address(0));
    // Up to 5 purchases at once.
    require(_amount >= 1 && _amount <= 5);
    var _priceOfBundle = merculetPrice * _amount;
    require(merculetContract.allowance(msg.sender, this) >= _priceOfBundle);
    if (merculetContract.transferFrom(msg.sender, this, _priceOfBundle)) {
      // Send Merculet tokens to the wallets.
      merculetContract.transfer(wallet1, _priceOfBundle / 2);
      merculetContract.transfer(wallet2, _priceOfBundle / 2);
      for (uint i = 0; i < _amount; i ++) {
        // Get value 0 ~ 9999.
        var _randomValue = random(10000, 0);
        // We hard-code this in order to give credential to the players. 
        uint8 _heroRankToMint = 0; 
        if (_randomValue < 5000) {
          _heroRankToMint = 1;
        } else if (_randomValue < 9550) {
          _heroRankToMint = 2;
        }  else if (_randomValue < 9950) {
          _heroRankToMint = 3;
        } else {
          _heroRankToMint = 4;
        }
        // Summon the hero.
        summonHero(msg.sender, _heroRankToMint);
      }
    }
  }
}