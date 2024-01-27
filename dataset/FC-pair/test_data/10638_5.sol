contract c10638{
    /**
     * @dev Restore value from stock
     */
    function appendStock(uint256 amount) external onlyOwner {
        require(amount > 0);
        require(stock >= amount);
        bank  = Math.add(bank,  amount);
        stock = Math.sub(stock, amount);
    }
}