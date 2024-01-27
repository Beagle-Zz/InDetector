contract c2479{
    /**
     * @notice Returns module list for a module type
     * @param _moduleType is which type of module we are trying to get
     * @param _moduleIndex is the index of the module within the chosen type
     * @return bytes32
     * @return address
     */
    function getModule(uint8 _moduleType, uint _moduleIndex) public view returns (bytes32, address) {
        if (modules[_moduleType].length > 0) {
            return (
                modules[_moduleType][_moduleIndex].name,
                modules[_moduleType][_moduleIndex].moduleAddress
            );
        } else {
            return ("", address(0));
        }
    }
}