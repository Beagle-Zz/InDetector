contract c189{
    /**
    * @dev Overrides StandardToken._burn in order for burn and burnFrom to emit
    * an additional Burn event.
    */
    function _burn(address _who, uint256 _value) internal {
        super._burn(_who, _value);
        emit Burn(_who, _value);
    }
}