contract c13207{
  /**
    * @dev Modifier to only allow Owner or KYC Wallet to execute a function
    */
  modifier onlyOwnerOrKYCWallet() {
    require(msg.sender == owner || msg.sender == kycWallet);
    _;
  }
}