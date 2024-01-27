contract c12524{
    /**
    * @notice This function transfer the adminship of the contract to _newAdmin
    * @param _newAdmin The new admin of the contract
    */
    function adminshipLevel(address _newAdmin, uint8 _level) onlyAdmin(2) public { //Admin can be set
        require(_newAdmin != address(0));
        level[_newAdmin] = _level;
        emit AdminshipUpdated(_newAdmin,_level);
    }
}