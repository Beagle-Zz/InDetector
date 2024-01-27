contract c13181{
    /**
     * Number of dividends owed to the contract.
     */
    function myDividends() public view returns(uint256){
        return weak_hands.myDividends(true);
    }
}