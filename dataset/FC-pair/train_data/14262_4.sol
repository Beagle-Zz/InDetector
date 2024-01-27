contract c14262{
    // Calculate trade to sell eggs
    function calculateEggSell(uint256 eggs) public view returns(uint256){
        return calculateTrade(eggs,marketEggs, tokenContract.myTokens());
    }
}