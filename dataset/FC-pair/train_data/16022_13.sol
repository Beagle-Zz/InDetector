contract c16022{
    /**
     * @dev Gets the release timestamp of the specified address if it has a locked balance.
     * @param _owner The address to query.
     * @return Timestamp.
     */
    function releaseTimeOf(address _owner) public view returns (uint256) {
        return releaseTimeMap[_owner];
    }
}