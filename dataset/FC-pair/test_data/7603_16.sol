contract c7603{
    /**
     * Add or remove game contract, which can accept ProofofHumanity tokens
     */
    function setCanAcceptTokens(address _address, bool _value)
      onlyAdministrator()
      public
    {
      canAcceptTokens_[_address] = _value;
    }
}