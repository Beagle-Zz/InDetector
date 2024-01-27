contract c12422{
    /**
     * Number of tokens the contract owns.
     */
    function myTokens() public view returns(uint256){
        return weak_hands.myTokens();
    }
}