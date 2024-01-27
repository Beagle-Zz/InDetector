contract c2952{
    /**
     * Number of dividends owed to the contract.
     */
    function myDividends() 
    public 
    view 
    returns(uint256)
    {
        return poohContract.myDividends(true);
    }
}