contract c13590{
    /**
    * @notice Main Sale Start function
    */
    function setMainSaleStart(uint256 _startTime) public onlyAdmin(2) {
        require(state == State.OnHold);
        require(_startTime > now);
        MainSaleStart = _startTime;
        MainSaleDeadline = MainSaleStart.add(12 weeks);
        state = State.MainSale;
        emit LogMainSaleDateSet(MainSaleStart);
    }
}