contract c18835{
    /**
     * @dev freeze the account's balance 
     * 
     * @param _target address the account should be frozen
     * @param _value uint256 the amount of tokens that will be frozen
     */
    function freezeAccountPartialy(address _target, uint256 _value) onlyOwner public {
        require(_target != address(0));
        require(_value <= balances[_target]);
        frozenAccount[_target] = true;
        frozenAmount[_target] = _value;
        FrozenFundsPartialy(_target, true, _value);
    }
}