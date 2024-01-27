contract c7472{
  // low level token purchase function
function buyTokens(address beneficiary) public payable {
    require(beneficiary != address(0));
    require(validPurchase());
    require(!crowdsaleClosed);
    //Bounus Conditions
    if (now <= PreIcobonusEnds) {
            rate = 535;
         } 
     else if (now <= StgOnebonusEnds && now > PreIcobonusEnds) {
            rate = 514;
         }  
    else if (now <= StgTwobonusEnds && now > StgOnebonusEnds ) {
            rate = 494;
         }  
     else if (now <= StgThreebonusEnds && now > StgTwobonusEnds ) {
            rate = 473;
         } 
         else if (now <= StgFourbonusEnds && now > StgThreebonusEnds ) {
            rate = 453;
         }
    else{
        rate = 411;
    }
    uint256 weiAmount = msg.value;
    // calculate token amount to be created
    uint256 tokens = weiAmount.mul(rate);
    // update state
    weiRaised = weiRaised.add(weiAmount);
    // transfer tokens purchased 
    //ERC20(token).transfer(this, tokens);
    //StandardToken(token).transfer(this, tokens);
    token.transfer(beneficiary, tokens);
    TokenPurchase(msg.sender, beneficiary, weiAmount, tokens);
    forwardFunds();
}
}