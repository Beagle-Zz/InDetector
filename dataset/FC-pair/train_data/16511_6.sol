contract c16511{
    /**
     * @dev Throws if called by any account other than the owner or the admin.
     */
    modifier onlyOwnerOrAdmin() {
        require(msg.sender == owner || msg.sender == admin);
        _;
    }
}