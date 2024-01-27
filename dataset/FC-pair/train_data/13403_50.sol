contract c13403{
    /// @notice tick count at the timestamp t. 
    /// @param t timestamp
    /// @return tick count
    function whichTick(uint t) public view returns(uint) {
        if (genesisTime > t) { 
            revert(); 
        }
        return (t - genesisTime) * timeScale / 1 minutes;
    }
}