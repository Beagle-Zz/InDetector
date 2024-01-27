contract c11527{
    // get user's vote history.
    function getUserVotes() public view returns(uint256[]){
        return votes[msg.sender];
    }
}