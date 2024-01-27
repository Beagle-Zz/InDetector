contract c16609{
    // update release amount for single day
    // according to dividend rule in https://coinhot.com
    function updateReleaseAmount(uint256 timestamp) internal {
        uint256 timeElapse = timestamp.sub(createTime);
        uint256 cycles = timeElapse.div(180 days);
        if (cycles > 0) {
            if (cycles <= 10) {
                releaseAmountPerDay = standardReleaseAmount;
                for (uint index = 0; index < cycles; index++) {
                    releaseAmountPerDay = releaseAmountPerDay.div(2);
                }
            } else {
                releaseAmountPerDay = 0;
            }
        }
    }
}