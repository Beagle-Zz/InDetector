contract c18987{
    /**
    * @dev Compara two numbers, and return the bigger one.
    */
    function max(int256 a, int256 b) internal pure returns (int256) {
        if (a > b) {
            return a;
        } else {
            return b;
        }
    }
}