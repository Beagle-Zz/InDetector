contract c14519{
    //return stats of token
    function getStats() external constant returns (uint256, uint256, bool, bool, bool) {
        return (totalEthInWei, tokenFunded, paused, mintStage, icoStage);
    }
}