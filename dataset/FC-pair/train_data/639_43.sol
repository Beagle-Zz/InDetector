contract c639{
    /**
        @dev Allows to feed a horsey to increase its feedingCounter value
            Gives a chance to get a rare trait
            The amount of carrots required is the value of current feedingCounter
            The carrots the user owns will be reduced accordingly upon success
            Cant be called while paused
        @param tokenId ID of the horsey to feed
    */
    function feed(uint256 tokenId) external 
    whenNotPaused()
    onlyOwnerOf(tokenId) 
    carrotsMeetLevel(tokenId)
    noFeedingInProgress()
    {
        pendingFeedings[msg.sender] = FeedingData(block.number,tokenId);
        uint8 feedingCounter;
        (,,feedingCounter,) = stables.horseys(tokenId);
        stables.storeCarrotsCredit(msg.sender,stables.carrot_credits(msg.sender) - uint32(feedingCounter));
        emit Feeding(tokenId);
    }
}