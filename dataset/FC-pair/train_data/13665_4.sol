contract c13665{
    /**
    * @dev Modifier that checks that the contract has finalized
    */
    modifier hasFinalized() {
        require(finalized);
        _;
    }
}