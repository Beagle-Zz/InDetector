contract c16377{
    /** @dev return data of client's dream by id */
    function getDStructData(address _who, uint256 _dream_id) 
        public 
        view 
        is_cli_or_trust 
        returns(string, string) 
    {
        require(DSData[_who][_dream_id].isDream == true);
        return (
            DSData[_who][_dream_id].dream, 
            DSData[_who][_dream_id].target
        );
    }
}