contract c2500{
    /**
     * @notice Add the tag for specified Module Factory
     * @param _moduleType Type of module.
     * @param _tag List of tags
     */
     function addTagByModuleType(uint8 _moduleType, bytes32[] _tag) public onlyOwner {
         for (uint8 i = 0; i < _tag.length; i++) {
             availableTags[_moduleType].push(_tag[i]);
         }
     }
}