contract c18021{
    /// check length >= min && <= max
    function checkStringLength(string name, uint min, uint max)
        internal
        pure
        returns (bool)
    {
        bytes memory temp = bytes(name);
        return temp.length >= min && temp.length <= max;
    }
}