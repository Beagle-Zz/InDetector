contract c12959{
/** 
 * These two function can be called by only whitelist suppliers.
 * First function take participants wallet address and add to whitelist.
 * Second function take participants wallet address and remove from whitelist.
 */
    function addToPublicWhitelist(address _participant) onlyWhitelistSupplier() public returns(bool) {
        if (whitelistPublic[_participant]) {
            return true;
        }
        whitelistPublic[_participant] = true;
        emit PublicWhitelistUpdated(_participant, true);
        return true;
    }
}