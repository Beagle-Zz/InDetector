contract c13634{
  /**
   * Same as above, does not seem to cause any issue.
   */
  function getKYCPayload(bytes dataframe) public constant returns(address whitelistedAddress, uint128 customerId, uint32 minEth, uint32 maxEth) {
    address _whitelistedAddress = dataframe.sliceAddress(0);
    uint128 _customerId = uint128(dataframe.slice16(20));
    uint32 _minETH = uint32(dataframe.slice4(36));
    uint32 _maxETH = uint32(dataframe.slice4(40));
    return (_whitelistedAddress, _customerId, _minETH, _maxETH);
  }
}