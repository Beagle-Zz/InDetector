contract c18305{
  /**
   * @dev Defines number of issued tokens. 
   */
    function setTotal(uint _amount) public onlyOwner {
      _totalTokens = _amount;
  }
}