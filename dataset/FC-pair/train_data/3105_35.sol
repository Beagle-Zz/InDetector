contract c3105{
    /**
     * @dev Calculate token emission.
     * @param _period Period for which to calculate emission.
     * @param _value Amount paid. Emissions is proportional to this.
     * @return Number of tokens to emit.
     * @return The spent balance.
     */
    function calculateEmission(uint _period, uint _value) internal view returns (uint, uint) {
        Period storage currentPeriod = periods[_period];
        uint minting = currentPeriod.minting;
        uint totalReceived = currentPeriod.totalReceived;
        uint scaledValue = _value;
        if (totalReceived > MAX_RECEIVED_PER_PERIOD) {
            // If the funds received this period exceed the maximum, scale
            // emission to refund remaining
            scaledValue = _value.mul(MAX_RECEIVED_PER_PERIOD).div(totalReceived);
        }
        uint emission = scaledValue.mul(minting).div(MAX_RECEIVED_PER_PERIOD);
        return (emission, scaledValue);
    }
}