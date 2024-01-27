contract c18169{
    /* -- Helper Functions -- */
    /**
    * @notice Internal function that ensures `_amount` is multiple of the granularity
    * @param _amount The quantity that want's to be checked
    */
    function requireMultiple(uint256 _amount) internal pure {
        require(_amount.div(granularity).mul(granularity) == _amount);
    }
}