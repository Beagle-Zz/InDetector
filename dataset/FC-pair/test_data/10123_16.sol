contract c10123{
    /* Portfolio Support */
    // Only called offchain - so we can omit additional pagination/optimizations here
    function portfolioSummary(address _address) 
        external 
        view 
    returns (
        uint[] _playerTokenContractId, 
        uint[] _totalTokens, 
        int[] _totalCost, 
        uint[] _totalValue) 
    {
        uint playerContractCount = totalPlayerTokenContracts();
        uint[] memory playerTokenContractIds = new uint[](playerContractCount);
        uint[] memory totalTokens = new uint[](playerContractCount);
        int[] memory totalCost = new int[](playerContractCount);
        uint[] memory totalValue = new uint[](playerContractCount);
        PlayerToken playerTokenContract;
        for (uint i = 0; i < playerContractCount; i++) {
            playerTokenContract = playerTokenContracts_[i];
            playerTokenContractIds[i] = i;
            (totalTokens[i], totalCost[i], totalValue[i]) = playerTokenContract.portfolioSummary(_address);
        }
        return (playerTokenContractIds, totalTokens, totalCost, totalValue);
    }
}