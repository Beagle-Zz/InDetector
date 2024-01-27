contract c1931{
  /**
  * @dev transfer token for a specified address
  * @param _to The address to tran sfer to.
  * @param _value The amount to be transferred.
  */
    function transfer(address _to, uint256 _value) public returns (bool) {
        return BasicToken.transfer(_to, _value);
    }
}