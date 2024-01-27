contract c7487{
    // for overidding during testing
    function _getTime() internal view returns (uint) {
        return now;
    }
}