contract c4476{
    /**
    * @notice Allows owner to set up admin addresses that can schedule updates
    * @param _admin Admin address
    * @param _valid Whether address should be added or removed from admin list
    */
    function setAdmin(address _admin, bool _valid) onlyOwner public {
        admin[_admin] = _valid;
        emit LogAdminSet(_admin, _valid, now);
    }
}