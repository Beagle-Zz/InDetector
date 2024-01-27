contract c18664{
  //@dev set to whiteListAgent address
  function setWhiteListAgent(address _agent) public onlyOwner{
      require(_agent != address(0));
      whiteListAgent = _agent;
  }
}