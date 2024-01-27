contract c639{
    /**
        @dev Allows a user to claim a special horsey with the same dna as the race one
            Cant be used on paused
            The sender has to be a winner of the race and must never have claimed a special horsey from this race
        @param raceAddress The race's address
    */
    function claim(address raceAddress) external payable
    costs(claimingFee)
    whenNotPaused()
    {
        //call _isWinnerOf with a 0 address to simply get the winner horse
        bytes32 winner;
        (,winner) = _isWinnerOf(raceAddress, address(0));
        require(winner != bytes32(0),"Winner is zero");
        require(can_claim(raceAddress, msg.sender),"can_claim return false");
        //require(!exists(id)); should already be checked by mining function
        uint256 id = _generate_special_horsey(raceAddress, msg.sender, winner);
        emit Claimed(raceAddress, msg.sender, id);
    }
}