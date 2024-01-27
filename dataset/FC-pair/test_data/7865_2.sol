contract c7865{
    // Give\deprive permission to a wallet for freeze tokens.
    function giveFreezePermission(address[] owners, bool permission)
        public
        onlyOwner
        returns(bool)
    {
        for (uint i = 0; i < owners.length; i++)
        {
        wallets[owners[i]].canFreezeTokens = permission;
        emit ChangeFreezePermission(owners[i], permission);
        }
        return true;
    }
}