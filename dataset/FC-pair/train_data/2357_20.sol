contract c2357{
    // close the pool from receiving more funds
    function closePool() onlyAdmin isOpenContract public {
        contractStage = CONTRACT_CLOSED;
        emit PoolStageChanged(contractStage);
    }
}