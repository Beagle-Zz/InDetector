contract c12454{
    // Modifiers and Structs
    // ========================================================
    // only run certain methods when contract is open
    modifier isOpenContract() {
        require (contractStage == CONTRACT_OPEN);
        _;
    }
}