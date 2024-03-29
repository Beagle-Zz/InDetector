contract c40139{
     
    function beyond(slice self, slice needle) internal returns (slice) {
        if (self._len < needle._len) {
            return self;
        }
        bool equal = true;
        if (self._ptr != needle._ptr) {
            assembly {
                let len := mload(needle)
                let selfptr := mload(add(self, 0x20))
                let needleptr := mload(add(needle, 0x20))
                equal := eq(sha3(selfptr, len), sha3(needleptr, len))
            }
        }
        if (equal) {
            self._len -= needle._len;
            self._ptr += needle._len;
        }
        return self;
    }
}