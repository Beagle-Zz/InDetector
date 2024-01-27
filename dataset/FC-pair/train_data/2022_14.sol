contract c2022{
    /**
        @dev Returns whether the address is whitelisted
        @param _owner The address of the owner
     */
    function isWhitelisted(address _owner) public view returns (bool) {
        return whitelist[_owner];
    }
}