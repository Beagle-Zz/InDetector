contract c13764{
    /**
     * @dev called by the owner to set default airdrop amount
     */
    function setTokenPrice(uint256 _value) onlyOwner public {
        tokenPrice_ = _value;
        emit onSetTokenPrice();
    }
}