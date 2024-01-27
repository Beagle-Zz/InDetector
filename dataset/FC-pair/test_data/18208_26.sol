contract c18208{
    /// @dev Emergency situation that requires contribution period to stop.
    /// Contributing not possible anymore.
    function halt() public onlyOwner{
        halted = true;
    }
}