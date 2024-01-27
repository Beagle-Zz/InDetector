contract c16833{
    /**
     * @dev Modifier to make a function callable only when there are unfrozen tokens.
     */
    modifier frozenTransferCheck(address _to, uint256 _value, uint256 balance) {
        if (now < unfreezeTimestamp){
            require(_value <= balance.sub(frozen[msg.sender]) );
        }
        _;
    }
}