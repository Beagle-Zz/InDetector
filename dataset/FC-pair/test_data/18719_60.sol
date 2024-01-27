contract c18719{
  /**
   * Finalize a successful crowdsale.
   *
   * The owner can trigger post-crowdsale actions, like releasing the tokens.
   * Note that by default tokens are not in a released state.
   */
  function finalize() public inState(State.Success) onlyOwner stopInEmergency {
    //Tokens sold + bounties represent 82% of the total, the other 18% goes to the multisig, partners and market making
    uint sold = tokensSold.add(initial_tokens);
    uint toShare = sold.mul(18).div(82);
    // Mint the 18% to the multisig
    token.setMintAgent(address(this), true);
    token.mint(multisigWallet, toShare);
    token.setMintAgent(address(this), false);
    // Release transfers and burn unsold tokens.
    token.releaseTokenTransfer();
    token.burn(token.balanceOf(address(this)));
    super.finalize();
  }
}