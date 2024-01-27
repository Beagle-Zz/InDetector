contract c12574{
    /**
     * Number of dividends received by the contract.
     */
    function totalDividends() public view returns(uint256){
        return dividends;
    }
}