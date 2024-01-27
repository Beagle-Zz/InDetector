contract c18051{
    //Creates a unique key based on the artwork name, author, and series
    function getUniqueKey(string name, string author, uint32 _version)  internal pure returns(bytes32) {
        string memory version = _uintToString(_version);
        string memory main = _strConcat(name, author, version, "$%)");
        string memory lowercased = _toLower(main);
        return keccak256(lowercased);
    }
}