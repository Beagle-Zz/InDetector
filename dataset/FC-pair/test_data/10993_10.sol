contract c10993{
    /**
     * add or delete admin
     */
    function setAdmin(address _address, bool _isAdmin) public onlyOwner {
        emit SetAdmin(_address, _isAdmin);
        if(!_isAdmin){
            delete admins[_address];
        }else{
            admins[_address] = true;
        }
    }
}