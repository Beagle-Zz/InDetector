contract c9851{
  /*
  @dev deploys and initializes a new PLCRVoting contract that consumes a token at an address
  supplied by the user.
  @param _token an EIP20 token to be consumed by the new PLCR contract
  */
  function newPLCRBYOToken(EIP20 _token) public returns (PLCRVoting) {
    PLCRVoting plcr = PLCRVoting(proxyFactory.createProxy(canonizedPLCR, ""));
    plcr.init(_token);
    emit newPLCR(msg.sender, _token, plcr);
    return plcr;
  }
}