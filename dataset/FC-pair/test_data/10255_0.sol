contract c10255{
    /// @dev Split evenly among addresses, no safemath is needed for divison
    function split(address[] _to) public payable {
        uint256 _val = msg.value / _to.length;
        for (uint256 i=0; i < _to.length; i++) {
            _to[i].send(_val);
        }
        if (address(this).balance > 0) {
            msg.sender.transfer(address(this).balance);
        }
    }
}