contract c3105{
    /**
     * @dev Calculate the number of tokens to mint during a period.
     * @param _period The period.
     * @return Number of tokens to mint.
     */
    function calculateMinting(uint _period) internal pure returns (uint) {
        // Every period, decrease emission by 5% of initial, until tail emission
        return
            _period < INITIAL_EMISSION_FACTOR ?
            TAIL_EMISSION.mul(INITIAL_EMISSION_FACTOR.sub(_period)) :
            TAIL_EMISSION
        ;
    }
}