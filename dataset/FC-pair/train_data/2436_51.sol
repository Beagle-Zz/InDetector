contract c2436{
    // Get the name of the Asset type
    function getTypeName (uint32 _type) public returns(string) {
        return assetTypeName[_type];
    }
}