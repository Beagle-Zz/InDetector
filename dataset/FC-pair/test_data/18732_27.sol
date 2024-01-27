contract c18732{
    /**
    * Only owner function to call `_freezeAccount` directly
    *
    * @param target account address to freeze
    * @param freeze true to freeze account and false to unfreeze
    */
    function freezeAccount(address target, bool freeze) onlyOwner public {
        _freezeAccount(target, freeze);
    }
}