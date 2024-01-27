contract c18878{
	/**
      * Reward tokens from delegated address
      *
      * Reward `_value` tokens to `_from` address
      *
      * @param _from The address of the sender
	  * @param _value the amount to send
      */
    function reward(address _from, uint256 _value)
        public
        onlySigner
    {
        require(contributions[_from]>=_value);
        contributions[_from] = contributions[_from].sub(_value);
        balances[_from] = balances[_from].add(_value);
        Reward(_from, _value);
    }
}