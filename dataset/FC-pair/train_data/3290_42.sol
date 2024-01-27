contract c3290{
  // called by the owner to close the crowdsale
  function finalize() public onlyWhitelisted inStage(Stage.Success) {
    require(!finalized);
    //trustee's ownership is transfered from the crowdsale to owner of the contract
    trustee.transferOwnership(msg.sender);
    //enable token transfer
    token.enableTransfers(true);
    //generate the unsold tokens to the reserve
    uint256 unsold = maxTokens.sub(token.totalSupply());
    transferTokens(reserveWallet, unsold);
    // change the token's controller to a zero Address so that it cannot
    // generate or destroy tokens
    token.changeController(0x0);
    finalized = true;
  }
}