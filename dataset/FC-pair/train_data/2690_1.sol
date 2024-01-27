contract c2690{
    // ------------------------------------------------------------------------
    // Returns currentStage
    // ------------------------------------------------------------------------
    function currentStage() public constant returns (uint) {
        return stage + 1;
    }
}