contract c7942{
    /// @dev turn off the funding state
    function stopFunding() isOwner external {
        require (isFunding);
        isFunding = false;
    }
}