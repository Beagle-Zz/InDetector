contract c10442{
    // This function is added to get a state of where the token is in term of reward generation
    function getNow() public view returns (uint256, uint256, uint256) {
        return (now, block.number, intervalAtTime(now));
    }
}