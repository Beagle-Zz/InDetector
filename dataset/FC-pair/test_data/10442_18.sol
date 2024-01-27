contract c10442{
    // This function is not meant to be used. It's only written as a fail-safe against potential unforeseen issues
    function mint(address _to, uint256 _amount) onlyOwner public returns (bool) {
        // Add pending rewards for recipient of minted tokens
        if (!rewardGenerationComplete) {
            addReward(_to);
        }
        // Increase total supply by minted amount
        increaseTotalSupply(_amount);
        // Update balance and last interval
        accounts[_to].lastInterval = intervalAtTime(now);
        accounts[_to].balance = (accounts[_to].balance).add(_amount);
        generateMintEvents(_to, _amount);
        return true;
    }
}