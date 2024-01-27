contract c10121{
    /**
     * @dev XRT emission value for utilized gas
     */
    function winnerFromGas(uint256 _gas) public view returns (uint256) {
        // Basic equal formula
        uint256 wn = _gas;
        if (totalGasUtilizing < 347 * (10 ** 10)) {
            wn *= 6;
        } else if (totalGasUtilizing < 2 * 347 * (10 ** 10)) {
            wn *= 4;
        } else if (totalGasUtilizing < 3 * 347 * (10 ** 10)) {
            wn = wn * 2667 / 1000;
        } else if (totalGasUtilizing < 4 * 347 * (10 ** 10)) {
            wn = wn * 1778 / 1000;
        } else if (totalGasUtilizing < 5 * 347 * (10 ** 10)) {
            wn = wn * 1185 / 1000;
        }
        return wn ;
    }
}