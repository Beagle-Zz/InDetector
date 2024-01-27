contract c13875{
    // Calculate eggs to buy simple
    function calculateEggBuySimple(uint256 eth) public view returns(uint256){
        return calculateEggBuy(eth, tokenContract.myTokens());
    }
}