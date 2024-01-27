contract c40139{
     
    function endsWith(slice self, slice needle) internal returns (bool) {
        if (self._len < needle._len) {
            return false;
        }
        var selfptr = self._ptr + self._len - needle._len;
        if (selfptr == needle._ptr) {
            return true;
        }
        bool equal;
        assembly {
            let len := mload(needle)
            let needleptr := mload(add(needle, 0x20))
            equal := eq(sha3(selfptr, len), sha3(needleptr, len))
        }
        return equal;
    }
}