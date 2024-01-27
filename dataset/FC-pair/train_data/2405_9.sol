contract c2405{
    // determines today's index.
    function today() private view returns (uint) { return block.timestamp / 1 days; }
}