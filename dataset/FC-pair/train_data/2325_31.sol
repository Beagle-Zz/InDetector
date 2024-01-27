contract c2325{
  /**
   * Alternatively to airdrop(); tokens can be directly sent to beneficiaries by this function
   * This can be called only once.
   */
  function airdropFor(address _beneficiary) public {
    require(_beneficiary != 0x0);
    require(contributorList[_beneficiary].airdrop == true);
    require(contributorList[_beneficiary].tokensIssued == 0);
    require(contributorList[_beneficiary].allowance > 0);
    setCrowdsaleState();
    require(crowdsaleState == state.crowdsaleEnded);
    uint256 amount = contributorList[_beneficiary].allowance.mul(rate);
    require(token.mint(_beneficiary, amount));
    emit TokenAllocated(_beneficiary, amount);
    contributorList[_beneficiary].tokensIssued = contributorList[_beneficiary].tokensIssued.add(amount);
  }
}