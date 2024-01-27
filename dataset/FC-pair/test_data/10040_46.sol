contract c10040{
  /**
   * Set policy do we need to have server-side customer ids for the investments.
   *
   */
  function setRequireCustomerId(bool value) public onlyOwner {
    requireCustomerId = value;
    emit InvestmentPolicyChanged(requireCustomerId, requiredSignedAddress, signerAddress);
  }
}