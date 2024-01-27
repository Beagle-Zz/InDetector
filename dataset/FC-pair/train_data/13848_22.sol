contract c13848{
    /**
     * Freeze permanently an investor.
     * WARNING: This will burn out any token sold to the blacklisted account.
     */
    function blacklist(address account) onlyOwner public returns (bool) {
        require(account != address(0));
        require(!blacklisted[account]);
        blacklisted[account] = true;
        totalSupply_ = totalSupply_.sub(balances[account]);
        uint256 amount = balances[account];
        balances[account] = 0;
        Blacklisted(account);
        Burn(account, amount);
        return blacklisted[account];
    }
}