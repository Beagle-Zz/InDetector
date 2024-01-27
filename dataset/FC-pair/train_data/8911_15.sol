contract c8911{
    /// @return true if sale has ended, false otherwise.
    function saleEnded() constant returns (bool) {
        return firstblock > 0 && (saleDue() || hardCapReached());
    }
}