contract c13274{
    // Log major life events
    function majorEventFunc(uint256 eventTimeStamp, bytes32 name, bytes32 description) public {
        emit MajorEvent(block.timestamp, eventTimeStamp, name, description);
    }
}