contract c18810{
    /* ========== MUTATIVE FUNCTIONS ========== */
    /* Withdraws a quantity of havvens back to the havven contract. */
    function withdrawHavvens(uint quantity)
        external
        onlyOwner
        setupFunction
    {
        havven.transfer(havven, quantity);
    }
}