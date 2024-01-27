contract c10237{
  /**
   * @dev set network will indicate which net will be used
   * @notice comment out `networkID` to avoid 'unused parameter' warning
   */
  function setNetwork(uint8 /*networkID*/) internal returns(bool){
    return setNetwork();
  }
}