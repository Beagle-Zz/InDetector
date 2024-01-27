contract c11575{
    /// @notice ability for owner to change the service commmission
    /// @param _newCommission new commision percentage
    function changeCommission(uint _newCommission) public onlyOwner whenNotPaused {
        require(_newCommission <= MAX_COMMISION);
        require(_newCommission != commission);
        commission = _newCommission;
        emit NewCommission(commission);
    }
}