contract c12029{
    /**
     * when there's income, the water mark goes up
     */
    function onIncome() public payable {
        if (msg.value > 0) {
            watermark += (msg.value / total);
            assert(watermark * total > watermark);
            emit INCOME(msg.value);
        }
    }
}