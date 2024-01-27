contract c11527{
    // stats only function
    function getSummary() public returns(uint256, uint256, uint256) {
        return(
            totalVotes,
            totalUsers,
            this.balance
        );
    }
}