contract c10059{
  // low level token purchase function
  function buyTokens(address beneficiary) public payable {
    require(beneficiary != 0x0);
    require(isCrowdsalePaused == false);
    require(validPurchase());
    uint256 weiAmount = msg.value;
    // calculate token amount to be created
    uint256 tokens = weiAmount.mul(ratePerWei);
    uint256 bonus = determineBonus(tokens,weiAmount);
    tokens = tokens.add(bonus);
    //if the user is first time buyer, add his entries
    if (usersBuyingInformation[beneficiary].recurringBuyer == false)
    {
        info = userInformation ({ userAddress: beneficiary, tokensToBeSent:tokens, ethersToBeSent:weiAmount, isKYCApproved:false,
                                recurringBuyer:true});
        usersBuyingInformation[beneficiary] = info;
        allUsers.push(beneficiary);
    }
    //if the user is has bought with the same address before too, update his entries
    else 
    {
        info = usersBuyingInformation[beneficiary];
        info.tokensToBeSent = info.tokensToBeSent.add(tokens);
        info.ethersToBeSent = info.ethersToBeSent.add(weiAmount);
        usersBuyingInformation[beneficiary] = info;
    }
    TOKENS_BOUGHT = TOKENS_BOUGHT.add(tokens);
    emit TokenPurchase(owner, beneficiary, weiAmount, tokens);
  }
}