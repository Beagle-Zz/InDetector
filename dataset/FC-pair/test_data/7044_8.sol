contract c7044{
    /**
     * @dev Suspend this ICO.
     * ICO can be activated later by calling `resume()` function.
     * In suspend state, ICO owner can change basic ICO parameter using `tune()` function,
     * tokens cannot be distributed among investors.
     */
    function suspend() public onlyOwner isActive {
        state = State.Suspended;
        emit ICOSuspended();
    }
}