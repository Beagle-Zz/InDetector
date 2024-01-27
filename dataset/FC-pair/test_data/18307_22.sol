contract c18307{
     /**
   * @dev Allows anyone to transfer the PAY tokens once trading has started
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _value uint the amout of tokens to be transfered
   */
  function transferFrom(address _from, address _to, uint _value)  public returns (bool) {
    require (super.transferFrom(_from, _to, _value) == true);
    list.changeBalance( _from, balances[_from]);
    list.changeBalance( _to, balances[_to]);
    return true;
  }
}