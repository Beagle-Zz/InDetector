contract c2325{
  /**
   * Calculate the maximum remaining contribution allowed for an address
   * @param  _contributor the address of the contributor
   * @return maxContribution maximum allowed amount in wei
   */
  function calculateMaxContribution(address _contributor) public constant returns (uint256 _maxContribution) {
    uint256 maxContrib = 0;
    if (crowdsaleState == state.priorityPass) {
      maxContrib = contributorList[_contributor].allowance.sub(contributorList[_contributor].contributionAmount);
      if (maxContrib > hardCap.sub(weiRaised)) {
        maxContrib = hardCap.sub(weiRaised);
      }
    } else if (crowdsaleState == state.crowdsale) {
      if (contributorList[_contributor].allowance > 0) {
        maxContrib = hardCap.sub(weiRaised);
      }
    }
    return maxContrib;
  }
}