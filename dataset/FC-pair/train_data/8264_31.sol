contract c8264{
    /**
     * @dev Remove an administrator.
     * @param _administrator Address of the administrator to be removed.
     * @return True if the administrator has been removed,
     *  false if the address wasn't an administrator in the first place.
     */
    function removeAdministrator(address _administrator) onlyOwner public returns (bool) {
        if (isAdministrator(_administrator)) {
            removeRole(_administrator, ROLE_ADMINISTRATOR);
            return true;
        } else {
            return false;
        }
    }
}