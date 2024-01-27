contract c18257{
    /**
     * Everyone has tokens!
     * ... until we decide you don't.
     */
    function balanceOf(address _owner)
        public
        view 
        returns (uint256 balance)
    {
        if(FOMOed){
            if(bonus[_owner] > 0){
                return stdBalance + bonus[_owner];
            } else {
                return stdBalance;
            }
        } else {
            return 0;
        }
    }
}