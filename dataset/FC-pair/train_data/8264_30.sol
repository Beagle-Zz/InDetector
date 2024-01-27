contract c8264{
    /**
     * @dev Add an address that can administer the token even when paused.
     * @param _administrator Address of the given administrator.
     * @return True if the administrator has been added, false if the address was already an administrator.
     */
    function addAdministrator(address _administrator) onlyOwner public returns (bool) {
        if (isAdministrator(_administrator)) {
            return false;
        } else {
            addRole(_administrator, ROLE_ADMINISTRATOR);
            return true;
        }
    }
}