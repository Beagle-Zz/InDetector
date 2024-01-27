contract c10674{
  /**
  * @dev swap M5 tokens back to regular tokens when GDP is back to positive 
  * @param _value The amount of M5 tokens to swap for regular tokens
  * @return true
  */
  function swap(uint256 _value) public returns (bool) {
    require(M5Logic_ != address(0));
    require(M5Token_ != address(0));
    require(M5Logic_.delegatecall(bytes4(keccak256("swap(uint256)")),_value)); // solium-disable-line
    return true;
  }
}