contract c18592{
    /// @dev Get time
    function getTime() internal constant returns(uint256) {
        return now;
    }
}