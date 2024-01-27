contract c18259{
    /**
     * @dev Calc bonus amount by contribution time
     */
    function getBonus() internal constant returns (uint256, uint256) {
        uint256 numerator = 0;
        uint256 denominator = 100;
        if(now < BONUS_WINDOW_1_END_TIME) {
            numerator = 25;
        } else if(now < BONUS_WINDOW_2_END_TIME) {
            numerator = 15;
        } else if(now < BONUS_WINDOW_3_END_TIME) {
            numerator = 10;
        } else if(now < BONUS_WINDOW_4_END_TIME) {
            numerator = 5;
        } else {
            numerator = 0;
        }
        return (numerator, denominator);
    }
}