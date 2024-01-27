contract c7244{
    // change parameters of the cell
    function editCell(address _key, uint256 _lockup) secondLevel public returns(bool){
        require(getBalanceCell(_key)==0);
        require(_lockup>= mainLockup);
        require(userCells[_key].exist);
        userCells[_key].lockup = _lockup;
        emit Edit(_key, _lockup);
        return true;
    }
}