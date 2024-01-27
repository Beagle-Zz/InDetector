contract c7828{
 /**
  * @dev Returns if a beneficiary is whitelisted
  * @return bool
  */
  function isWhitelisted(address _beneficiary) public view returns (bool) {
    if (caps[_beneficiary] != 0) {
      return true;
    }
    return false;
  }
}