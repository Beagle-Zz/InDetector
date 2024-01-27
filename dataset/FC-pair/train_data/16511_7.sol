contract c16511{
    /**
     * @dev Allows the current owner to change administrator account of the contract to a newAdmin.
     * @param newAdmin The address to transfer ownership to.
     */
    function changeAdmin(address newAdmin) public onlyOwner {
        require(newAdmin != address(0));
        emit AdminChanged(admin, newAdmin);
        admin = newAdmin;
    }
}