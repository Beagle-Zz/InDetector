contract c7962{
    /// @dev Access-modifier for Animator-only functionality.
    modifier onlyAnimator() {
        require(msg.sender == animatorAddress);
        _;
    }
}