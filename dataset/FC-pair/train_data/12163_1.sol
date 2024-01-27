contract c12163{
  // low level token purchase function
  function buyTokens(address beneficiary) public payable {
    require(beneficiary != address(0));
        if (!purchasingAllowed) { throw; }
        if (msg.value < 1 finney * MINfinney) { return; }
        if (msg.value > 1 finney * MAXfinney) { return; }
    // calculate token amount to be created
    uint256 UTWDAmounts = calculateObtained(msg.value);
    // update state
    weiRaised = weiRaised.add(msg.value);
    require(ERC20Basic(UTWD).transfer(beneficiary, UTWDAmounts));
    TokenPurchase(msg.sender, beneficiary, msg.value, UTWDAmounts);
    forwardFunds();
  }
}