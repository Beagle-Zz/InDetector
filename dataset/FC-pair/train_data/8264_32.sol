contract c8264{
    /**
     * @dev Determine if address is an administrator.
     * @param _administrator Address of the administrator to be checked.
     */
    function isAdministrator(address _administrator) public view returns (bool) {
        return hasRole(_administrator, ROLE_ADMINISTRATOR);
    }
}