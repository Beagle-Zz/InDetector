contract c40083{
   
  function setExportFee(address addr, uint256 fee) onlyOwner {
    exportFee[addr] = fee;
    
    Processed(msg.sender);
  }
}