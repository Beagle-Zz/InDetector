contract c12016{
    ///////////////////
    // BETS IN Tokens and ETH
    ///////////////////
    function totalWinValue() public view returns(uint) {
        uint result = 0;
        for (uint i = 0; i < flipIds.length; i++) {
            if (flips[flipIds[i]].status == FlipStatus.Won) {
                result = result.add(flips[flipIds[i]].winTokens);
            }            
        }
        return result;
    }
}