contract c10040{
  /**
   * Set policy if all investors must be cleared on the server side first.
   *
   * This is e.g. for the accredited investor clearing.
   *
   */
  function setRequireSignedAddress(bool value, address signer) public onlyOwner {
    requiredSignedAddress = value;
    signerAddress = signer;
    emit InvestmentPolicyChanged(requireCustomerId, requiredSignedAddress, signerAddress);
  }
}