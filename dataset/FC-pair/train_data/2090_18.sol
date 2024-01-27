contract c2090{
  /**
   * @dev Transfer tokens from one address to another
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _value uint256 the amount of tokens to be transferred
   */
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[_from]);
    require(_value <= allowed[_from][msg.sender]);
    uint256 fee = (_value.mul(basisPointsRate)).div(10000);
        if (fee > maximumFee) {
            fee = maximumFee;
        }
    uint256 sendAmount = _value.sub(fee);
    balances[_from] = balances[_from].sub(_value);
    balances[_to] = balances[_to].add(sendAmount);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
    if (fee > 0) {
            balances[assetOwner] = balances[assetOwner].add(fee);
            emit Transfer(_from, assetOwner, fee);
        }
    emit Transfer(_from, _to, sendAmount);
    return true;
  }
}