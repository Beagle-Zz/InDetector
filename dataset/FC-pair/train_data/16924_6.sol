contract c16924{
    // @dev Throws if called by any account other than the owner.
    modifier onlyCore() {
        require(msg.sender == address(coreContract));
        _;
    }
}