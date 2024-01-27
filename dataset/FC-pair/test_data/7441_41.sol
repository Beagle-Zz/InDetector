contract c7441{
    /**
     * @dev override purchase validation to add extra value logic.
     * @return true if sended more than minimal value
     */
    function validPurchase() internal view returns (bool) {
        bool minValue = msg.value >= 100000000000000000;
        bool maxValue = msg.value <= 1000000000000000000000;
        return
            minValue &&
            maxValue &&
            super.validPurchase();
    }
}