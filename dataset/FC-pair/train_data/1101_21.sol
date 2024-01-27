contract c1101{
    // Only owner can set minBet   
    function ownerSetMinBet(uint newMinimumBet) public
    onlyOwner
    {
      minBet = newMinimumBet;
    }
}