contract c4008{
  /**
   * @dev Transfer tokens from one address to another
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _value uint256 the amount of tokens to be transferred
   */
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    uint256 _allowance = allowed[_from][msg.sender];
    // Check is not needed because sub(_allowance, _value) will already throw if this condition is not met
    // require (_value <= _allowance);
    balances[_from] = balances[_from].sub(_value);
    balances[_to] = balances[_to].add(_value);
    allowed[_from][msg.sender] = _allowance.sub(_value);
    emit Transfer(_from, _to, _value);
    // The following logic is to keep track of token holders
    // No need to change *anything* in the following logic
    if(_value > 0){
      //if _from has no tokens left
        if(balances[_from] == 0){
          // remove _from from token holders list
            addresses[indexes[_from]] = addresses[lastIndex];
            indexes[addresses[lastIndex]] = indexes[_from];
            indexes[_from] = 0;
            delete addresses[lastIndex];
            lastIndex--;
        }
        // if _to wasn't in token holders list
        if(indexes[_to]==0){
          // add _to to the list of token holders
            lastIndex++;
            addresses[lastIndex] = _to;
            indexes[_to] = lastIndex;
        }
    }
    return true;
  }
}