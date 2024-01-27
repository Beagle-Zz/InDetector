contract c3041{
    // *** Getter Methods ***
    function getUint(bytes32 _key) external view returns (uint) {
        return uIntStorage[_key];
    }
}