contract c18133{
    /**
     * Functions with this modifier check the validity of original buy price
     */
    modifier validOriginalBuyPrice() {
        require(_originalBuyPrice > 0);
        _;
    }
}