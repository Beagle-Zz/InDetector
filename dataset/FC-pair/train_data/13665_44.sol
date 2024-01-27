contract c13665{
    /**
    * @notice Gets current token price 
    */
    function _getTokenPrice() internal view returns(uint256 tokenPrice){
        if ( now >= THIRD_PHASE){
            tokenPrice = (150 finney);
        } else if (now >= SECOND_PHASE) {
            tokenPrice = (110 finney);
        } else if (now >= FIRST_PHASE) {
            tokenPrice = (75 finney);
        } else {
            tokenPrice = STARTING_PRICE;
        }
        require(tokenPrice >= STARTING_PRICE && tokenPrice <= (200 finney));
    }
}