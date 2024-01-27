contract c12167{
  // low level token purchase function
  function buyTokens(address beneficiary) public payable {
    require(beneficiary != address(0));
        if (!purchasingAllowed) { throw; }
        if (msg.value < 1 finney * MINfinney) { return; }
        if (msg.value > 1 finney * MAXfinney) { return; }
    // calculate token amount to be created
    uint256 UBTCAmounts = calculateObtained(msg.value);
    // update state
    weiRaised = weiRaised.add(msg.value);
    require(ERC20Basic(UBTC).transfer(beneficiary, UBTCAmounts));
    TokenPurchase(msg.sender, beneficiary, msg.value, UBTCAmounts);
    forwardFunds();
  }
}