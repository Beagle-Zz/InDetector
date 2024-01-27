contract c4831{
  /**
   * @dev low level token purchase ***DO NOT OVERRIDE***
   */
    function buyTokens() public payable {
        // do necessary checks
        require(crowdsaleOpen);
        require(msg.sender != address(0));
        require(msg.value != 0);
        require(amountRaised.add(msg.value) <= cap);
        // calculate token amount to be created
        uint256 tokens = (msg.value).mul(rate);
        // update state
        amountRaised = amountRaised.add(msg.value);
        // transfer tokens to buyer
        token.transfer(msg.sender, tokens);
        // transfer eth to fund wallet
        fundWallet.transfer(msg.value);
        emit TokenPurchase (msg.sender, msg.value, tokens);
    }
}