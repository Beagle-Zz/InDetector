contract c10225{
    /**** Hash Helpers **************/
    function kcck256str(string _key1) external pure returns (bytes32) {
        return keccak256(_key1);
    }
}