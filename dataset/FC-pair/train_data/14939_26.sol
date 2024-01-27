contract c14939{
  //@dev add some ETH for oraclize updater 
  function addEtherForOraclize () public payable {
    oraclizeBalance = oraclizeBalance.add(msg.value);
  }
}