contract c10363{
    // set admins
    function setAdmin(address[] _admins, bool _v) onlyOwner public {
        for (uint256 i = 0; i<_admins.length; i++) {
            admins[ _admins[i] ] = _v;
        }
    }
}