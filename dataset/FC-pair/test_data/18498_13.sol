contract c18498{
    /**
    * @dev Add an contract admin
    */
    function setContractAdmin(address _admin, bool _isAdmin, uint _index) external onlyOwner {
        require(_admin != address(0));
        require(0 <= _index && _index < 3);
        contractAdmins[_admin] = _isAdmin;
        if(_isAdmin){
            admins[_index] = _admin;
        }
    }
}