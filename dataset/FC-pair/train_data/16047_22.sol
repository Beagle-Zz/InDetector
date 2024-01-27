contract c16047{
    /**
    * Called internally by the airdrop function to ensure the contract holds enough tokens
    * to succesfully execute the airdrop.
    *
    * @param _values The list of values representing the amount of tokens which will be airdroped.
    **/
    function getSumOfValues(uint256[] _values) internal pure returns(uint256) {
        uint256 sum = 0;
        for(uint i=0; i < _values.length; i++) {
            sum = sum.add(_values[i]);
        }
        return sum;
    } 
}