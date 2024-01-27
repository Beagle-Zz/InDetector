contract c12897{
    /**
     * Functions with this modifier check on sale status
     * Only allow sale if _selling is on
     */
    modifier onSale() {
        require(_selling);
        _;
    }
}