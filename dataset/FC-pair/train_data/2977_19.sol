contract c2977{
  /**
  * Standard ERC20 transfer tokens function
  * @param _to {address}
  * @param _amount {uint}
  * @return success {bool}
  */
  function transfer(address _to, uint256 _amount) public returns (bool success) {
    return doTransfer(msg.sender, _to, _amount);
  }
}