contract c7625{
  /**
   * @dev Original ERC20 approve with additional security mesure.
   * @param _spender The address which will spend the funds.
   * @param _value The amount of tokens to be spent.
   * @return A boolean that indicates if the operation was successful.
   */
  function approve(address _spender, uint256 _value)
    public
    returns (bool)
  {
    //https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
    require((_value == 0) || (allowed[msg.sender][_spender] == 0));
    return super.approve(_spender, _value);
  }
}