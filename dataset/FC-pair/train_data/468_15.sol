contract c468{
    /*
     *
     * Permissions when transferEnabled is false :
     *              ContractOwner    Admin    SaleContract    Others
     * transfer            x           v            v           x
     * transferFrom        x           v            v           x
     *
     * Permissions when transferEnabled is true :
     *              ContractOwner    Admin    SaleContract    Others
     * transfer            v           v            v           v
     * transferFrom        v           v            v           v
     *
     */
    /*
     * Check if token transfer is allowed
     * Permission table above is result of this modifier
     */
    modifier onlyWhenTransferAllowed() {
        require(transferEnabled == true
            || msg.sender == adminAddr
            || msg.sender == tokenSaleAddr);
        _;
    }
}