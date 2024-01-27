contract c10342{
  // Get identity wallet
  function getIdentityWallet(address _id) public view returns (address) {
    return identities[_id].wallet;
  }
}