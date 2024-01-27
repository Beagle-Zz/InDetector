contract c18009{
    /**
        @dev disables the entire conversion functionality
        this is a safety mechanism in case of a emergency
        can only be called by the manager
        @param _disable true to disable conversions, false to re-enable them
    */
    function disableConversions(bool _disable) public ownerOrManagerOnly {
        conversionsEnabled = !_disable;
    }
}