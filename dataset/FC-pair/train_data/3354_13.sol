contract c3354{
    // Decsendants should use _sender() instead of msg.sender to properly process proxied calls.
    function _sender() constant internal returns(address) {
        return this == msg.sender ? genericSender : msg.sender;
    }
}