contract c8911{
    /*
     * PUBLIC FUNCTIONS
     */
    /// @dev Start the token sale.
    /// @param _firstblock The block from which the sale will start.
    function start(uint _firstblock) public onlyOwner beforeStart {
        if (_firstblock <= block.number) {
            // Must specify a block in the future.
            throw;
        }
        firstblock = _firstblock;
        SaleStarted();
    }
}