contract c13207{
  /**
  * @dev Get User's referrer address
  * @param _user User Address
  */
  function getUserReferrer(address _user) public view returns (address) {
    return supportersMap[_user].referrerAddress;
  }
}