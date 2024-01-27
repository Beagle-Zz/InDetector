contract c8311{
    /// @notice put item into mapping
    function put(ContentMapping storage self, 
        string _name, 
        string _description, 
        uint _reward) public returns (bool) 
    {
            require(!self.locked);
            bytes32 _id = generateContentID(_name);
            require(self.data[_id].id == bytes32(0));
            self.data[_id] = Content(_id, _name, _description, block.timestamp, DeliverableUtils.newDeliverable(_reward));
            self.keys.push(_id);
            return true;
    }
}