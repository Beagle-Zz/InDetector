contract c8614{
  //Mainly for front-end administration
  function isArbitrator(address arbitratorCheck) external view returns(bool) {
    return (aribitratorWhitelist[arbitratorCheck] || arbitratorCheck == primaryArbitrator);
  }
}