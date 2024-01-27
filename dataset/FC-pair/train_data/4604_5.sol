contract c4604{
    // only owner
    function changeOwnerStart(address _newOwner) public {
        require(msg.sender == owner);
        newOwner = _newOwner;
        ChangeOwnerStarted(msg.sender, _newOwner);
    } //
}