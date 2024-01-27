contract c7629{
// returns true if the rootHash was impacted, i.e. it's available and exists in the ipfsAddresses array
// and false if otherwise
function getStatusForRootHash(bytes32 _rootHash) constant public returns (bool)
{
 bytes memory tempEmptyStringTest = bytes(ipfsAddresses[_rootHash]); // Uses memory
 if (tempEmptyStringTest.length == 0) {
    // emptyStringTest is an empty string, hence the _rootHash was not impacted there so does not exist
    return false ; 
} else {
    // emptyStringTest is not an empty string
    return true ; 
}
} 
}