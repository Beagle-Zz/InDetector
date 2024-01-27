contract c18073{
  /**
   * @notice Get the address of the RareCoin contract
   * @return The address of the RareCoin contract
   */
    function getRareCoinAddress() external view returns (address) {
        return _rcContract;
    }
}