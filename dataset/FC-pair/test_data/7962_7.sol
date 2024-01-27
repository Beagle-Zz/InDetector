contract c7962{
    /// @dev Access-modifier for C-level-only functionality.
    modifier onlyCLevel() {
        require(
            msg.sender == animatorAddress ||
            msg.sender == ceoAddress ||
            msg.sender == cfoAddress
        );
        _;
    }
}