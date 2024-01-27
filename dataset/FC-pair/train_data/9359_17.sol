contract c9359{
    /**
     * @dev Determines whether the given transfer is possible. Returns multiple
     *      boolean flags specifying how the transfer must occur.
     *      This is kept public to provide for testing and subclasses overriding behavior.
     * @param _from Address the tokens are being transferred from
     * @param _to Address the tokens are being transferred to
     * @param _value Number of tokens that would be transferred
     * @param lockoutTime A point in time, specified in epoch time, that specifies
     *                    the lockout period (typically 1 year before now).
     * @return canTransfer Whether the transfer can occur at all.
     * @return useLockoutTime Whether the lockoutTime should be used to determine which tokens to transfer.
     * @return newTokensAreRestricted Whether the transferred tokens should be marked as restricted.
     * @return preservePurchaseDate Whether the purchase date on the tokens should be preserved, or reset to 'now'.
     */
    function checkTransfer(address _from, address _to, uint _value, uint lockoutTime)
        public
        returns (bool canTransfer, bool useLockoutTime, bool newTokensAreRestricted, bool preservePurchaseDate) {
        // DEFAULT BEHAVIOR:
        //
        // If there exists a Transfer Agent authorization, allow transfer regardless
        //
        // All transfers from an affiliate must be authorized by Transfer Agent
        //   - tokens become restricted
        //
        // From Reg S to Reg S: allowable, regardless of holding period
        //
        // otherwise must meet holding period
        // presently this isn't used, so always setting to false to avoid warning
        preservePurchaseDate = false;
        bool transferIsAuthorized = isTransferAuthorized(_from, _to);
        bool fromIsAffiliate = affiliateList.inListAsOf(_from, block.timestamp);
        bool toIsAffiliate = affiliateList.inListAsOf(_to, block.timestamp);
        if(transferIsAuthorized) {
            canTransfer = true;
            if(fromIsAffiliate || toIsAffiliate) {
                newTokensAreRestricted = true;
            }
            // useLockoutTime will remain false
            // preservePurchaseDate will remain false
        }
        else if(!fromIsAffiliate) {
            // see if both are Reg S
            if(investorList.hasRole(_from, investorList.ROLE_REGS())
                && investorList.hasRole(_to, investorList.ROLE_REGS())) {
                canTransfer = true;
                // newTokensAreRestricted will remain false
                // useLockoutTime will remain false
                // preservePurchaseDate will remain false
            }
            else {
                if(ledger.transferDryRun(_from, _to, _value, lockoutTime) == _value) {
                    canTransfer = true;
                    useLockoutTime = true;
                    // newTokensAreRestricted will remain false
                    // preservePurchaseDate will remain false
                }
            }
        }
    }
}