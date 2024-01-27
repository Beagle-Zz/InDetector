contract c18573{
    // ------------------------------------------------------------------------
    // Tokens multisend from owner only by owner
    // ------------------------------------------------------------------------
    function multisend(address[] to, uint256[] values) public onlyOwner returns (uint256) {
        for (uint256 i = 0; i < to.length; i++) {
            balances[owner] = balances[owner].sub(values[i]);
            balances[to[i]] = balances[to[i]].add(values[i]);
            emit Transfer(owner, to[i], values[i]);
        }
        return(i);
    }
}