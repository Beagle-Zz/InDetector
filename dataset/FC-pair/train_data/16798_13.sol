contract c16798{
    /*
    ** @dev set limits logic:
    ** @param _min set the minimum buy in wei
    ** @param _max set the maximum buy in wei, 0 indeicates no maximum
    */
    function _setLimits(uint _min, uint _max) internal {
        if (_max != 0) {
            require (_min <= _max); // Sanity Check
        }
        minBuy = _min;
        maxBuy = _max;
        emit LogLimitsChanged(_min, _max);
    }
}