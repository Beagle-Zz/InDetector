contract c40145{
     
    function join(slice self, slice[] parts) internal returns (string) {
        if (parts.length == 0)
            return "";
        uint len = self._len * (parts.length - 1);
        for(uint i = 0; i < parts.length; i++)
            len += parts[i]._len;
        var ret = new string(len);
        uint retptr;
        assembly { retptr := add(ret, 32) }
        for(i = 0; i < parts.length; i++) {
            memcpy(retptr, parts[i]._ptr, parts[i]._len);
            retptr += parts[i]._len;
            if (i < parts.length - 1) {
                memcpy(retptr, self._ptr, self._len);
                retptr += self._len;
            }
        }
        return ret;
    }
}