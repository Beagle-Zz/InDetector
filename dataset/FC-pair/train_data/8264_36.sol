contract c8264{
    /**
     * @dev Adds rate modifier checking not to add one with a start smaller than the previous.
     * @param _rateModifier RateModifier struct.
     */
    function pushModifier(RateModifier _rateModifier) internal {
        require(modifiers.length == 0 || _rateModifier.start > modifiers[modifiers.length - 1].start);
        modifiers.push(_rateModifier);
    }
}