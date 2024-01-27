contract c8311{
    /// @notice add content to the agreement
    function addContent(string _name, 
        string _description, 
        uint _reward) notLocked onlyBrand validReward(_reward) 
        public returns(bool _success) {
            return content.put(_name, _description, _reward);
    }
}