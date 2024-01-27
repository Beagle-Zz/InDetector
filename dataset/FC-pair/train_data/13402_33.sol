contract c13402{
    /// @notice Transfer the token from sender to all the addresses provided in array.
    /// @dev Left 160 bits are the recipient address and the right 96 bits are the token amount.
    /// @param bits array of uint
    /// @return true/false
    function multiTransfer(uint[] bits) public transferable returns (bool) {
        return super.multiTransfer(bits);
    }
}