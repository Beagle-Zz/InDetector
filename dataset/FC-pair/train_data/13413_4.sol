contract c13413{
    /**
    @dev Unlocks tokens locked in unrevealed vote where poll has ended
    @param _pollID Integer identifier associated with the target poll
    */
    function rescueTokens(uint _pollID) public {
        require(isExpired(pollMap[_pollID].revealEndDate));
        require(dllMap[msg.sender].contains(_pollID));
        dllMap[msg.sender].remove(_pollID);
        emit _TokensRescued(_pollID, msg.sender);
    }
}