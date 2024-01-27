contract c12408{
    /**
     * @dev Access modifier, which restricts functions to only the "finance" role
     */
    modifier onlyFinance() {
        checkRole(msg.sender, ROLE_FINANCE);
        _;
    }
}