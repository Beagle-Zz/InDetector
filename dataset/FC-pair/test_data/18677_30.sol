contract c18677{
  /**
   * Allow anonymous contributions to this crowdsale.
   */
  function invest(address addr) public payable {
    if(requireCustomerId) throw; // Crowdsale needs to track participants for thank you email
    if(requiredSignedAddress) throw; // Crowdsale allows only server-side signed participants
    investInternal(addr, 0);
  }
}