contract c2012{
    /**
        @dev Returns owner address based on the key
        @param _key The key of the address in the map
     */
    function getOwnerAddress(uint _key) public view returns (address) {
        return address(ownerMap.get(_key));
    }
}