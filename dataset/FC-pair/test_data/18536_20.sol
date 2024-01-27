contract c18536{
//
// Contract management functions
//
    // Initiate a change of owner to `_owner`
    function changeOwner(address _owner)
        public
        onlyOwner
        returns (bool)
    {
        emit ChangeOwnerTo(_owner);
        newOwner = _owner;
        return true;
    }
}