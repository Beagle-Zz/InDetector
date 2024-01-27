contract c2051{
    /**
    * @dev Burns the tokens of the specified address.
    * @param _owner The holder of tokens.
    * @param _value The amount of tokens burned
    */
  function burn(address _owner,uint256 _value) internal  {
    require(_value <= balanceOf(_owner));
    // no need to require value <= totalSupply, since that would imply the
    // sender's balance is greater than the totalSupply, which *should* be an assertion failure
    setBalanceOf(_owner, balanceOf(_owner).sub(_value));
    setTotalSupply(totalSupply().sub(_value));
    emit Burn(_owner, _value);
    emit Transfer(_owner, address(0), _value);
  }
}