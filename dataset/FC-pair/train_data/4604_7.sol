contract c4604{
    // only owner
    function addManager(address _acc) public {
        require(msg.sender == owner);
        isManager[_acc] = true;
        ManagerAdded(_acc, msg.sender);
    } //
}