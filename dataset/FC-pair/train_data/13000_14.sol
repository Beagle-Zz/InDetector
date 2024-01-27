contract c13000{
    /// @dev Reverts if called by any account other than the owner for token sending.
    modifier onlyTokenOwner() {
        require(tkn.sender == owner);
        _;
    }
}