contract c8710{
     /**
      @dev Private function to manage GrapheneTech purchases by calculating the right number
           of tokens based on the value sent.
           Includes any purchase within a mapping to track address and amount spent.
           Tracks the number of tokens sold. and ICO amount raised
           Transfer tokens to the buyer address.
           Calculates refound value if applais.
     */
    function _transfer() private onlyInState(StatusList.Running) {
        uint amount = msg.value;
        uint amountToReturn = 0;
        uint tokens = 0;
        (tokens, amountToReturn) = getTokens(amount);
        purchaseMap[msg.sender] = purchaseMap[msg.sender].add(amount);
        tokensSold = tokensSold.add(tokens);
        amount = amount.sub(amountToReturn);
        amountRaised = amountRaised.add(amount);
        if (stage == StagesList.PrivateICO) availablePrivateICO = availablePrivateICO.sub(tokens);
        if (stage == StagesList.PreICO) availablePreICO = availablePreICO.sub(tokens);
        if (stage == StagesList.ICO_w1) availableICO_w1 = availableICO_w1.sub(tokens);
        if (stage == StagesList.ICO_w2) availableICO_w2 = availableICO_w2.sub(tokens);
        tokenReward.transfer(msg.sender, tokens);
        sendETH(amount);
        if (amountToReturn > 0) {
            bool refound = msg.sender.send(amountToReturn);
            require(refound);
        }
        emit Purchase(msg.sender, amount, tokens);
    }
}