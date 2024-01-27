contract c654{
    /**
        @dev Allows a user to burn a token he owns to get carrots
            The mount of carrots given is equal to the horsey's feedingCounter upon burning
            Cant be called on a horsey with a pending feeding
            Cant be called while paused
        @param tokenId ID of the token to burn
    */
    function freeForCarrots(uint256 tokenId) external 
    whenNotPaused()
    onlyOwnerOf(tokenId) {
        require(pendingFeedings[msg.sender].horsey != tokenId,"");
        //credit carrots
        uint8 feedingCounter;
        (,,feedingCounter,) = stables.horseys(tokenId);
        stables.storeCarrotsCredit(msg.sender,stables.carrot_credits(msg.sender) + uint32(feedingCounter * carrotsMultiplier));
        stables.unstoreHorsey(tokenId);
        emit HorseyFreed(tokenId);
    }
}