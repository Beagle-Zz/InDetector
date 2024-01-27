contract c135{
    /// @dev insures the caller payed the required amount
    modifier costs(uint256 amount) {
        require(msg.value >= amount,"Not enough funds");
        _;
    }
}