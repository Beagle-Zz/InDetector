contract c16047{
    /**
    * Returns the amount of tokens that have been sold.
    **/
    function getTokensSold() public view returns(uint256) {
        return tokensSold;
    }
}