contract c10123{
    /* Safeguard function to quickly pause a stack of contracts */
    function pausePlayerContracts(uint startIndex, uint endIndex) onlyOwnerOrReferee external {
        for (uint i = startIndex; i < endIndex; i++) {
            PlayerToken playerTokenContract = playerTokenContracts_[i];
            if (!playerTokenContract.paused()) {
                playerTokenContract.pause();
            }
        }
    }
}