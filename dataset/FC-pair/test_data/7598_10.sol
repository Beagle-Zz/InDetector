contract c7598{
    /**
     * FEATURE 6): Budget control
     * Malloc GPX for airdrops, marketing-events, bonus, etc 
     */
    function mallocBudget(address _admin, uint256 _value) mostOwner(keccak256(msg.data)) external returns (bool) {
        require(_admin != address(0));
        require(_value <= balances[tokenPool]);
        balances[tokenPool] = balances[tokenPool].sub(_value);
        balances[_admin] = balances[_admin].add(_value);
        Transfer(tokenPool, _admin, _value);
        return true;
    }
}