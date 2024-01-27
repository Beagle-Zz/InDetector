contract c8888{
    /// @dev View function to see that last time that the rate was updated. 
    function getLastTimeUpdated()
        public
        view
        returns(uint256)
    {
        return lastTimeUpdated;
    }
}