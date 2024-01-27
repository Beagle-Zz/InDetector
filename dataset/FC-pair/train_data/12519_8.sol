contract c12519{
    // Empty the jackpot participants list
    function clearJackpotParticipants() public onlyOwner returns (bool success) {
        index = 0;
        return true;
    }
}