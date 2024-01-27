contract c9850{
    /**
    @notice Determines if poll is over
    @dev Checks isExpired for specified poll's revealEndDate
    @return Boolean indication of whether polling period is over
    */
    function pollEnded(uint _pollID) constant public returns (bool ended) {
        require(pollExists(_pollID));
        return isExpired(pollMap[_pollID].revealEndDate);
    }
}