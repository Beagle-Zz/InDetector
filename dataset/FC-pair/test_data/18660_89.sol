contract c18660{
  // @dev Pay with Eth.
  function payWithEth(uint256 _amount, address _referralAddress)
    whenNotPaused
    public
    payable
  {
    require(msg.sender != address(0));
    // Referral address shouldn't be the same address.
    require(msg.sender != _referralAddress);
    // Up to 5 purchases at once.
    require(_amount >= 1 && _amount <= 5);
    var _priceOfBundle = ethPrice * _amount;
    require(msg.value >= _priceOfBundle);
    // Send the raised eth to the wallet.
    wallet.transfer(_priceOfBundle);
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
      // In case there exists referral address...
      if (_referralAddress != address(0)) {
        // Add mileage to the referral address.
        addressToMileagePoint[_referralAddress] += 5;
        addressToMileagePoint[msg.sender] += 3;
      }
    }
  }
}