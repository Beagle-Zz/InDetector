contract c12959{
/** 
 * This modifier allows only owner of the token and holder of the token call a function.
 */
    modifier isReleased () {
        require(released || msg.sender == holder || msg.sender == owner);
        _;
    }
}