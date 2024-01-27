contract c13665{
    /**
    * @notice sets the champion, second, third and fourth teams to the contract storage
    * @param id 
    * @param result ids of the four teams
    */
    function dataSourceCallbackFinals(uint id, uint8[4] result) public {
        require (msg.sender == dataSourceAddress);
        uint256 i;
        for(i = 0; i < 4; i++){
            bracketsResults.finalsTeamsIds[i] = result[i];
        }
        LogFinalsArrived(id, result);
    }
}