contract c2026{
    /**
        @dev Returns a owner, all the values in the struct
        @param _owner Address of the owner
     */
    function getOwner(address _owner) public view returns (uint256, uint256, uint256) {
        Owner storage o = owners[_owner];
        return (o.key, o.shareTokens, o.percentage);
    }
}