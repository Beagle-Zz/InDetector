contract c13401{
    /// @notice current auction
    /// @return auction count 
    function currentAuction() public view returns(uint) {
        return whichAuction(currentTick());
    }
}