contract c10267{
    //@notice Get the total jackpot value, which is contract balance if the jackpot is not completed.Else
    //its retrieved from variable jackpotCompleted
    function getJackpotTotalValue() public view returns(uint256) {
        if(jackpotCompleted){
            return finalJackpotValue;
        } else{
            return address(this).balance;
        }
    }
}