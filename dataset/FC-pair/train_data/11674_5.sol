contract c11674{
    /**
    * @notice This function transfer the adminship of the contract to _newAdmin
    * @param _newAdmin User address
    * @param _level User new level
    */
    function assingAdminship(address _newAdmin, uint8 _level) onlyAdmin(2) public { //Admin can be transfered
        admin[_newAdmin] = _level;
        emit AssignAdminship(_newAdmin , _level);
    }
}