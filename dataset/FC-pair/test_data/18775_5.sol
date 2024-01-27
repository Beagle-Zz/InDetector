contract c18775{
  // release Customer's account after KYC
  function releaseAccount(address _owner) internal returns (bool) {
    releaseTime[_owner] = now;
    return true;
  }
}