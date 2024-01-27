contract c13665{
    /**
    * @notice Testing function to corroborate extra data from oraclize call
    * @return amount of yellow and red cards
    */
    function getExtrasData() external view returns(uint16 a, uint16 b){
        a = extraResults.yellowCards;
        b = extraResults.redCards;  
    }
}