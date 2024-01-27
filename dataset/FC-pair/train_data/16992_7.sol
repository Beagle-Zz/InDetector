contract c16992{
    /**
     * transfer token for a specified address.
     *
     * @param _to The address to transfer to.
     * @param _value The amount to be transferred.
     */
    function transfer(address _to, uint256 _value) public {
        /// Locked account can not complete the transfer.
        require(!(lockJackpots != 0x0 && msg.sender == lockJackpots));
        /// Transponding the TOS token to a locked tokens account will be deemed a lock-up activity.
        if (lockJackpots != 0x0 && _to == lockJackpots) {
            _lockToken(_value);
        }
        else {
            /// To unlock the time, automatically unlock tokens.
            if (unLockTime <= now && lockBalanceOf[msg.sender] > 0) {
                lockBalanceOf[msg.sender] = 0;
            }
            _transfer(msg.sender, _to, _value);
        }
    }
}