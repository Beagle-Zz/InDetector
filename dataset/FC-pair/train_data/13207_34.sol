contract c13207{
  /**
  * @dev Check if user has passed KYC
  * @param _user User Address
  */
  function userHasKYC(address _user) public view returns (bool) {
    return supportersMap[_user].hasKYC;
  }
}