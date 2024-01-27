contract c2026{
    /**
        @dev Returns whether a owner has claimed their tokens
        @param _owner The address of the owner
        @param _dId The distribution id
     */
    function hasClaimed(address _owner, uint256 _dId) public view returns (bool) {
        Distribution storage d = distributions[_dId]; 
        return d.claimedAddresses[_owner];
    }
}