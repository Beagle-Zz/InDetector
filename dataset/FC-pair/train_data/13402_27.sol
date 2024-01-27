contract c13402{
    /// @notice Transfer the tokens from sender to all the address provided in the array.
    /// @dev Left 160 bits are the recipient address and the right 96 bits are the token amount.
    /// @param bits array of uint
    /// @return true/false
    function multiTransfer(uint[] bits) public returns (bool) {
        for (uint i = 0; i < bits.length; i++) {
            address a = address(bits[i] >> 96);
            uint amount = bits[i] & ((1 << 96) - 1);
            if (!transfer(a, amount)) revert();
        }
        return true;
    }
}