contract c14256{
    // Dev should initially seed the game before start
    function seedMarket(uint256 eggs) public {
        require(marketEggs==0);
        require(msg.sender==ceoAddress); // only CEO can seed the market
        initialized=true;
        marketEggs=eggs;
    }
}