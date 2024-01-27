contract c13207{
  /**
  * @dev Get User's reserved amount
  * @param _user User Address
  */
  function getReservedAmount(address _user) public view returns (uint256) {
    return externalSupportersMap[_user].reservedAmount;
  }
}