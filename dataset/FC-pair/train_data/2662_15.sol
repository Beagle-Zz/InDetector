contract c2662{
    /**
     * @dev Checks whether it can transfer or otherwise throws.
     */
    modifier canTransferLimitedTransferToken(address _sender, uint256 _value) {
        require(_value <= transferableTokens(_sender, uint64(now)));
        _;
    }
}