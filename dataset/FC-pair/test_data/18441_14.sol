contract c18441{
  // Determine the outcome manually,
  // immediately
  function determineWinner(uint gas, uint gasPrice) payable public onlyOwnerLevel canDetermineWinner {
    ORACLIZE_GAS = gas;
    oraclize_setCustomGasPrice(gasPrice);
    callOracle(0, ORACLIZE_GAS);
  }
}