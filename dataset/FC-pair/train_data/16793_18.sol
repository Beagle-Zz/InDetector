contract c16793{
  /**
  * @dev Allows anyone to transfer the Change tokens once trading has started
  * @param _to the recipient address of the tokens.
  * @param _value number of tokens to be transfered.
   */
  function transfer(address _to, uint _value) hasStartedTrading whenNotPaused public returns (bool) {
    return super.transfer(_to, _value);
  }
}