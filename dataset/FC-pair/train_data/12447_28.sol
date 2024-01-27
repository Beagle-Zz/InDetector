contract c12447{
    // internal migrate migration tokens
    function _migrateToken(address _from, address _to)
        internal
    {
        PresaleToken presale = PresaleToken(namiPresale);
        uint256 newToken = presale.balanceOf(_from);
        require(newToken > 0);
        // burn old token
        presale.burnTokens(_from);
        // add new token to _to
        balanceOf[_to] = balanceOf[_to].add(newToken);
        // add new token to totalSupply
        totalSupply = totalSupply.add(newToken);
        emit LogMigrate(_from, _to, newToken);
        emit Transfer(this,_to,newToken);
    }
}