contract c16826{
        /**
        * @dev Transfer tokens from one address to another with pause feature for owner.
        * @dev Only applies when the transfer is allowed by the owner.
        * @param _from address The address which you want to send tokens from
        * @param _to address The address which you want to transfer to
        * @param _value uint256 the amount of tokens to be transferred
        */
        function transferFrom(address _from, address _to, uint256 _value) whenNotPaused public returns (bool) {
            super.transferFrom(_from, _to, _value);
        }
}