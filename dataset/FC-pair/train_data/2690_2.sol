contract c2690{
    // ------------------------------------------------------------------------
    // Returns maxSupplyReached True / False
    // ------------------------------------------------------------------------
    function maxSupplyReached() public constant returns (bool) {
        return stage >= stageTotal;
    }
}