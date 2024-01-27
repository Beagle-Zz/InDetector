contract c16533{
    //There's no limit to the coin supply
    //reward follows the same emmission rate as Dogecoins'
    function getMiningReward(bytes32 digest) public constant returns (uint) {
        if(epochCount > 600000) return (30000 * 10**uint(decimals) );
        if(epochCount > 500000) return (46875 * 10**uint(decimals) );
        if(epochCount > 400000) return (93750 * 10**uint(decimals) );
        if(epochCount > 300000) return (187500 * 10**uint(decimals) );
        if(epochCount > 200000) return (375000 * 10**uint(decimals) );
        if(epochCount > 145000) return (500000 * 10**uint(decimals) );
        if(epochCount > 100000) return ((uint256(keccak256(digest, blockhash(block.number - 2))) % 1500000) * 10**uint(decimals) );
        return ( (uint256(keccak256(digest, blockhash(block.number - 2))) % 3000000) * 10**uint(decimals) );
    }
}