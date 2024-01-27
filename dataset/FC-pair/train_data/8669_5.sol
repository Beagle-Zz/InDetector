contract c8669{
    /**
     * @dev Throws if called by any account other than the authorized or owner.
     */
    modifier onlyAuthorized() {
        require(msg.sender == owner || authorized[msg.sender]);
        _;
    }
}