contract c18688{
    /**
     * @dev   Slices a string according to specified delimiter, returning
     *        the sliced parts in an array.
     *
     * @param _string   The string to be sliced.
     */
    function stringToArray(string _string) internal returns (string[]) {
        var str    = _string.toSlice();
        var delim  = ",".toSlice();
        var parts  = new string[](str.count(delim) + 1);
        for (uint i = 0; i < parts.length; i++) {
            parts[i] = str.split(delim).toString();
        }
        return parts;
    }
}