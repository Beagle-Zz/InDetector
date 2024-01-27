contract c358{
    /**
     * set the price of asset
     * @param newPrice price of asset
     * Only can be called by holder
     */
    function setPrice(uint newPrice) public onlyHolder {
        require(isValid == true, "contract is invaild");
        price = newPrice;
    }
}