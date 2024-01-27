contract c16793{
  /**
  * @dev Allows anyone to transfer the Change tokens once trading has started
  * @param _from address The address which you want to send tokens from
  * @param _to address The address which you want to transfer to
  * @param _value uint the amout of tokens to be transfered
   */
  function transferFrom(address _from, address _to, uint _value) hasStartedTrading whenNotPaused public returns (bool) {
    return super.transferFrom(_from, _to, _value);
  }
}