contract c3545{
    /**
    * @dev Increments uniqueness index. Overflow intentionally allowed.
    */
    function incrementUniquenessIndex() external onlyLogicContract {
        uniquenessIndex ++;
    }
}