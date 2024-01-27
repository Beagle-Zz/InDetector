contract c3545{
    /**
    * @dev Appends uint (in decimal) to a string
    * @param _str The prefix string
    * @param _value The uint to append
    * @return resulting string
    */
    function _appendUintToString(string _str, uint _value) internal pure returns (string) {
        uint maxLength = 100;
        bytes memory reversed = new bytes(maxLength);
        uint i = 0;
        while (_value != 0) {
            uint remainder = _value % 10;
            _value = _value / 10;
            reversed[i++] = byte(48 + remainder);
        }
        i--;
        bytes memory inStrB = bytes(_str);
        bytes memory s = new bytes(inStrB.length + i + 1);
        uint j;
        for (j = 0; j < inStrB.length; j++) {
            s[j] = inStrB[j];
        }
        for (j = 0; j <= i; j++) {
            s[j + inStrB.length] = reversed[i - j];
        }
        return string(s);
    }
}