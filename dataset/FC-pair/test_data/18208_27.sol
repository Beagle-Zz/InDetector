contract c18208{
    /// @dev Emergency situation resolved.
    /// Contributing becomes possible again withing the outlined restrictions.
    function unHalt() public onlyOwner{
        halted = false;
    }
}