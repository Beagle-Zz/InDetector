contract c1502{
    /**
     * @dev Set up specific fee and status threshold
     * @param _st The status to set up for
     * @param _percentages Array of pecentages, which should go to member
     * @param _threshold The minimum amount of sum of children deposits to get
     *                   the status _st
     */
    function setFeeDistributionAndStatusThreshold(
        uint8 _st,
        uint16[5] _percentages,
        uint _threshold
    )
        private
    {
        statusThreshold[_threshold] = _st;
        for (uint8 i = 0; i < _percentages.length; i++) {
            feeDistribution[_st][i] = _percentages[i];
        }
    }
}