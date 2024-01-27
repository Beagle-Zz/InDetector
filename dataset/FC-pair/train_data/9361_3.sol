contract c9361{
    /**
     * @dev Throws if called by any account that's not investorListed.
     * @param role string
     */
    modifier validRole(string role) {
        require(
            keccak256(bytes(role)) == keccak256(bytes(ROLE_REGD)) ||
            keccak256(bytes(role)) == keccak256(bytes(ROLE_REGCF)) ||
            keccak256(bytes(role)) == keccak256(bytes(ROLE_REGS)) ||
            keccak256(bytes(role)) == keccak256(bytes(ROLE_UNKNOWN))
        );
        _;
    }
}