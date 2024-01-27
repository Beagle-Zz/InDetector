contract c2532{
    /**
     *  setAdmin allows owner to change address of admin.
     *  @param _admin New address of admin
     */
    function setAdmin(address _admin) public onlyOwner {
        require(_admin != 0x0);
        admin = _admin;
    }
}