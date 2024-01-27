contract c12607{
  /**
   * @dev Function to change oracle
   * @param _oracle The address of new oracle.
   */  
  function changeOracle(address _oracle) external onlyOwner {
      oracle = _oracle;
  }
}