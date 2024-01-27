contract c7473{
  /**
   * @dev Receive the call from Oraclize
   * @param _oraclizeID The oraclize id
   * @param _result The text resulting from requesting the url
   */
  function __callback(
    bytes32 _oraclizeID,
    string _result
  )
  public
  {
    require(msg.sender == oraclize_cbAddress());
    if (bytes(_result).length > 0) {
      manager.setIdentity(__tempData[_oraclizeID].appId, __tempData[_oraclizeID].sender, _result);
    } else {
      VerificatioFailed(_oraclizeID);
    }
  }
}