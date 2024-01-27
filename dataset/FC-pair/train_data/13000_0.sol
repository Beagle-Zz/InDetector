contract c13000{
    /// @dev Reverts if called by any account other than the owner.
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}