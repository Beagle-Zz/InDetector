contract c10093{
    // Backwards compatibility.
    function multiAsset() constant returns(EToken2Interface) {
        return etoken2;
    }
}