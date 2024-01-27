contract c10075{
    /*******************************************************************************
     * Payable's section
     */
    function isPreSale() public constant returns(bool) {
        return now >= startPreSale && now <= endPreSale;
    }
}