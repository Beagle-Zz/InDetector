contract c16802{
    // Backwards compatibility.
    function multiAsset() constant returns(EToken2Interface) {
        return etoken2;
    }
}