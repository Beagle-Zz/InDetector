contract c2479{
    /**
     * @notice returns module list for a module name - will return first match
     * @param _moduleType is which type of module we are trying to get
     * @param _name is the name of the module within the chosen type
     * @return bytes32
     * @return address
     */
    function getModuleByName(uint8 _moduleType, bytes32 _name) public view returns (bytes32, address) {
        if (modules[_moduleType].length > 0) {
            for (uint256 i = 0; i < modules[_moduleType].length; i++) {
                if (modules[_moduleType][i].name == _name) {
                  return (
                      modules[_moduleType][i].name,
                      modules[_moduleType][i].moduleAddress
                  );
                }
            }
            return ("", address(0));
        } else {
            return ("", address(0));
        }
    }
}