contract c4974{
    // store purity and shine as one number to save users gas
    function _getPurity(uint16 randOne, uint16 randTwo) internal pure returns (uint16) {
        if (randOne >= 998) {
            return 3000 + randTwo;
        } else if (randOne >= 988) {
            return 2000 + randTwo;
        } else if (randOne >= 938) {
            return 1000 + randTwo;
        } else {
            return randTwo;
        }
    }
}