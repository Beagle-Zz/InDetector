contract c11728{
    /**
     * Verify if game is approved
     * 
     **/
    function isGameApproved(address _gameAddress) view public returns(bool){
        if(approvedGames[_gameAddress] == true){
            return true;
        }else{
            return false;
        }
    }
}