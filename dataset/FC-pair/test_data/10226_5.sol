contract c10226{
    /*** Role Utilities */
    /**
    * @dev Check if an address is an owner
    * @return bool
    */
    function isOwner(address _address) public view returns (bool) {
        return rocketStorage.getBool(keccak256("access.role", "owner", _address));
    }
}