contract c7962{
    /// @dev Set Studio Fee. Can only be called by the Animator address. 
    function setPlatformFee(uint256 _val) external onlyAnimator {
        platformFee = _val;
    }
}