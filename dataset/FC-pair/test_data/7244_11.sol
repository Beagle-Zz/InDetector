contract c7244{
    // information on lockup of cell for holder
    function getInfoCellLockup() view public returns(uint256){
        return userCells[msg.sender].lockup;
    }
}