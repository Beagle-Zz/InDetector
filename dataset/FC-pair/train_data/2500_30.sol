contract c2500{
    /**
     * @notice Use to get all the tags releated to the functionality of the Module Factory.
     * @param _moduleType Type of module
     * @return bytes32 array
     */
    function getTagByModuleType(uint8 _moduleType) public view returns(bytes32[]) {
        return availableTags[_moduleType];
    }
}