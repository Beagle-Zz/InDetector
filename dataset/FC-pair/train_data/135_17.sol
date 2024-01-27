contract c135{
    /**
        @dev Helper function which stores in memory an array which is passed in, and
        @param item element we are looking for
        @param array the array to look into
        @return the index of the item of interest
    */
    function _indexOf(uint item, uint256[] memory array) internal pure returns (int256){
        //Iterate over array to find indexOf(token)
        for(uint256 i = 0; i < array.length; i++){
            if(array[i] == item){
                return int256(i);
            }
        }
        //Item not found
        return -1;
    }
}