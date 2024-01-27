contract c16389{
    /// @dev Set the high water line/ceiling
    /// @param _highWater Sets the threshold to shift Ether to another address
    function setHighWater(uint256 _highWater) public ifAuthorized(msg.sender, APHRODITE) {
        highWater = _highWater;
    }
}