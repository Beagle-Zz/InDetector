contract c7244{
    // information on balance of cell for holder
    function getInfoCellBalance() view public returns(uint256){
        return userCells[msg.sender].balance;
    }
}