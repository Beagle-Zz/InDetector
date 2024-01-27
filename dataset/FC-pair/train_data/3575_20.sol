contract c3575{
    /**
     * @dev The transaction is valid if the gas price limit is lifted-off or the transaction meets the requirement
     */
    function validateTransaction() internal view {
        require(gasPriceLimit == 0 || tx.gasprice <= gasPriceLimit);
        return super.validateTransaction();
    }
}