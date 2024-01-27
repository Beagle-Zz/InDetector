contract c8614{
  //Mainly for front-end administration
  function isApprovedWallet(address walletCheck) external view returns(bool) {
    return (withdrawerWhitelist[walletCheck] || walletCheck == primaryWallet);
  }
}