contract c7045{
    /**
     * @dev Checks if given address is an administrator.
     * @param _addr address The address which you want to check.
     * @return True if the address is an administrator and fase otherwise.
     */
    function isAdministrator(address _addr) public constant returns (bool) {
        return administrators[_addr];
    }
}