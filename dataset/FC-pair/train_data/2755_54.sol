contract c2755{
    /// Overrides of the standard token's functions to add the paused/unpaused functionality.
    function transfer(address _to, uint256 _value) public whenNotPaused returns (bool) {
        return super.transfer(_to, _value);
    }
}