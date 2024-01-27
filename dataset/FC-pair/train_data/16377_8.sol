contract c16377{
    /** @dev change perferfer for uncomplited task if he is fail */
    function changePrefererForTask(address _addr, uint256 _id, address _performer) public is_pf_mng returns(bool) {
        require(performers[_performer] == true);
        if(DSData[_addr][_id].isDream == true) {
            DSData[_addr][_id].hasPerformer = true;
            DSData[_addr][_id].performer = _performer;
            return true;
        }
    }
}