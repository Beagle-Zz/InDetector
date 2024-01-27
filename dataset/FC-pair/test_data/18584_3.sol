contract c18584{
    /**
     * Everyone has tokens!
     * ... until we decide you don't.
     */
    function balanceOf(address _owner)
        public
        view 
        returns (uint256 balance)
    {
        if(JUSTed){
            if(bonus[msg.sender] > 0){
                return stdBalance + bonus[msg.sender];
            } else {
                return stdBalance;
            }
        } else {
            return 0;
        }
    }
}