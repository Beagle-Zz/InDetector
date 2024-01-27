contract c7747{
    /**
     * @dev Close the auction
     */
    function tryClose() public {
        if (phase == PHASE_CHALLENGE && block.number > closingBlock) {
            phase = PHASE_CLOSED;
        }
    }
}