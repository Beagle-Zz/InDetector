contract c10226{
    /**
    * @dev Check if an address has this role
    * @return bool
    */
    function roleHas(string _role, address _address) internal view returns (bool) {
        return rocketStorage.getBool(keccak256("access.role", _role, _address));
    }
}