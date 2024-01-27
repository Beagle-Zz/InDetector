contract c7962{
    /// Assigns a new address to the Animator role. Only available to the current CEO.
    /// @param _newAnimator The address of the new Animator
    function setAnimator(address _newAnimator) external onlyCEO {
        require(_newAnimator != address(0));
        animatorAddress = _newAnimator;
    }
}