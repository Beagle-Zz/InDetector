contract c18835{
    /**
     * @dev freeze the account's balance 
     *
     * by default all the accounts will not be frozen until set freeze value as true. 
     * 
     * @param _target address the account should be frozen
     * @param _freeze bool if true, the account will be frozen
     */
    function freezeAccount(address _target, bool _freeze) onlyOwner public {
        require(_target != address(0));
        frozenAccount[_target] = _freeze;
        frozenAmount[_target] = balances[_target];
        FrozenFunds(_target, _freeze);
    }
}