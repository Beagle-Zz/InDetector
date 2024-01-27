contract c13760{
    /// @dev set seed by coo
    function setSeed( uint val) public onlyCOO {
        seed = val;
    }
}