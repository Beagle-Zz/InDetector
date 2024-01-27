contract c40596{
     
    function ChangeOwnership(address _owner) onlyowner {
        admin = _owner;
    }
}