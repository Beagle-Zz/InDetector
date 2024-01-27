contract c18309{
   /**
   * @dev Allows anyone to transfer the PAY tokens once trading has started
   * @param _to the recipient address of the tokens. 
   * @param _value number of tokens to be transfered. 
   */
  function transfer(address _to, uint _value) hasStartedTrading  public returns (bool) {
    require(super.transfer(_to, _value) == true);
    list.changeBalance( msg.sender, balances[msg.sender]);
    list.changeBalance( _to, balances[_to]);
    return true;
  }
}