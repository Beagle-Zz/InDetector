contract c13743{
	/* Send _value amount of tokens from address _from to address _to
     * The transferFrom method is used for a withdraw workflow, allowing contracts to send
     * tokens on your behalf
     * @param _from address from which amount is to be transferred
     * @param _to address to which amount is transferred
     * @param _amount to which amount is transferred
     */
    function transferFrom(
         address _from,
         address _to,
         uint256 _amount
     ) public returns (bool success)
      {
         if (balanceOf[_from] >= _amount
             && allowed[_from][msg.sender] >= _amount
             && _amount > 0
             && balanceOf[_to].add(_amount) > balanceOf[_to])
        {
             balanceOf[_from] = balanceOf[_from].sub(_amount);
             allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_amount);
             balanceOf[_to] = balanceOf[_to].add(_amount);
             return true;
        } else {
             return false;
        }
    }
}