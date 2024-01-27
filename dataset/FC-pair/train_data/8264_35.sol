contract c8264{
    /**
     * @dev Finds currently applicable rate modifier.
     * @return Current rate modifier percentage.
     */
    function currentModifier() public view returns (uint256 rateModifier) {
        // solium-disable-next-line security/no-block-members
        uint256 comparisonVariable = now;
        for (uint i = 0; i < modifiers.length; i++) {
            if (comparisonVariable >= modifiers[i].start) {
                rateModifier = modifiers[i].ratePermilles;
            }
        }
    }
}