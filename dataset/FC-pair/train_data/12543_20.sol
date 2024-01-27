contract c12543{
    /**
     * Function is called internally by the airdrop() function to ensure that 
     * there are enough tokens remaining to execute the airdrop. 
     * 
     * @param _values The list of values representing the tokens to be sent
     * @return Returns the sum of all the values
     * */
    function getSumOfValues(uint256[] _values) internal pure returns(uint256 sum) {
        sum = 0;
        for(uint i = 0; i < _values.length; i++) {
            sum = sum.add(_values[i]);
        }
    }
}