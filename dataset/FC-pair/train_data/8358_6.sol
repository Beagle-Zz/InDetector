contract c8358{
    /**
     * @dev Checks whether it can transfer or otherwise throws.
     */
    modifier canTransfer(address _sender, uint _value) {
        if (_value > transferableTokens(_sender, now, block.number)) revert();
        _;
    }
}