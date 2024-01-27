contract c7021{
  /**
   * @dev Allows the current congress to transfer control of the contract to a newCongress.
   * @param newCongress The address to transfer congress to.
   */
  function transferCongress(address newCongress) public onlyDiscussable {
    require(newCongress != address(0));      
    emit CongressTransferred(congress, newCongress);
    congress = newCongress;
  }
}