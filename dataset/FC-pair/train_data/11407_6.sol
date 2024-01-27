contract c11407{
    /**
     * Validate star parameters
     */
    function isValidGid(uint8 gid) internal view returns(bool) {
        return gid > 0 && gid <= gidMax;
    }
}