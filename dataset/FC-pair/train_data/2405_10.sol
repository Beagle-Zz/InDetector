contract c2405{
    // kills the contract sending everything to `_to`.
    function kill(address _to) onlymanyowners(keccak256(abi.encodePacked(msg.data))) external {
        selfdestruct(_to);
    }
}