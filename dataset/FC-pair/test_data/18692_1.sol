contract c18692{
    // define the other cards which might play in defining the winner. 
    function GetCardNumber(uint8 rank, uint8 suit) public pure returns (uint8){
        if (rank==0){
            return 0;
        }
        return ((rank-1)*4+1)+suit;
    }
}