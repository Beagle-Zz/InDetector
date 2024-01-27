contract c13764{
    /**
     * @dev Function to stop/continue purchase new tokens.
     * @return True if the operation was successful.
     */
    function setPurchasable(bool _value) onlyOwner public returns (bool) {
        purchasable = _value;
        emit onSetPurchasable();
        return true;
    }
}